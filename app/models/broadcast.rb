class Broadcast < ApplicationRecord
  acts_as_taggable
  
  belongs_to :user
  belongs_to :message_script

  
  def self.dispatch(broadcast:)
    BroadcastDispatcher.new(broadcast: broadcast)
    ## start possible new way
    # contacts_to_receive_broadcast = user.contacts.tagged_with(roster_tags, :any => true)
    # return if Array(contacts_to_receive_broadcast).length < 1
    # assemble message with dispatch time
    # msg = self.set_what_and_when_of_message(broadcast)
    #
    # # disseminate message to contacts
    # disseminate_message_to_contacts(message: msg, contacts: contacts_to_receive_broadcast)
  end
  
  
  
  # def self.disseminate_message_to_contacts(message: msg, contacts: contacts_to_receive_broadcast)
    # contacts_to_receive_broadcast.each do |contact|
    #   log "#{current_user} sent #{contact.first_name} the message: #{message.body} "
    #   # Create the message with the contact as the owner
    #   @message = contact.message.create!(message.to_h)
    #   Message.dispatch_message_at_the_scheduled_time(@message)
    #
    # end
  # end
    
  # def self.collect_broadcast_message_attributes(broadcast)
    # message_attributes = OpenStruct.new(body: broadcast.message_body,
    #                       title:              broadcast.message_title,
    #                       message_script_id:  broadcast.message_script_id,
    #                       dispatched_at:      broadcast.dispatched_at,
    #                       user_id:            broadcast.user_id)
  # end
  
  # def self.set_what_and_when_of_message(broadcast)
    # message_attributes = self.collect_broadcast_message_attributes(broadcast)
    # script_id = message_attributes.message_script_id.to_i
    # if message_attributes.body.length < 2
    #   message_attributes.title  = broadcast.message_script.title
    #   message_attributes.body   = broadcast.message_script.body
    # else
    #   # keep original message and title from user
    # end
    # result = message_attributes
  # end
  
  def self.basic_contact_tag_list
	  tags = ActsAsTaggableOn::Tag.all.where('basic = ?', true).order(:name)
    
  end
  
end
