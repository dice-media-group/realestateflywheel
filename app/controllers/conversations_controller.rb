class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :mailbox, :conversation

  def create
    recipient_emails = conversation_params(:recipients).split(',')
    recipients = Contact.where(email: recipient_emails).all

    conversation = current_user.send_message(recipients, *conversation_params(:body, :subject)).conversation
    @message_sender = User.find(conversation_params[:message_sender]).first_name
    render "index"

    send_text_message
    send_text_message_to_contact_from_current_user(contact_email: "", body:"Hi there", subject:"Hello")
    
    # recipient_emails = conversation_params(:recipients).split(',')
    # recipients = User.where(email: recipient_emails).all
    #
    # conversation = current_user.
    #   send_message(recipients, *conversation_params(:body, :subject)).conversation
    #
    # redirect_to conversation_path(conversation)
  end

  def reply
    current_user.reply_to_conversation(conversation, *message_params(:body, :subject))
    redirect_to conversation_path(conversation)
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to :conversations
  end

  def send_text_message_to_contact_from_current_user(contact_email: "", body:"Hi there", subject:"Hello")
    message_body      = "#{body} -- from #{current_user.name}"
    current_contact   = GuaranteedContact.find_by_email(Contact.first.email_address)
    sent_message      = Courier.new.send_message(to: current_contact.primary_phone, body: message_body)
  end


  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def conversation_params(*keys)
    fetch_params(:conversation, *keys)
  end

  def message_params(*keys)
    fetch_params(:message, *keys)
  end

  def fetch_params(key, *subkeys)
    params[key].instance_eval do
      case subkeys.size
      when 0 then self
      when 1 then self[subkeys.first]
      else subkeys.map{|k| self[k] }
      end
    end
  end
  
  
  

  
end
