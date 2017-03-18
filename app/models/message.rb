class Message < ApplicationRecord
  belongs_to :contact
  belongs_to :user
  belongs_to :message_script
  belongs_to :broadcast
  
  # validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :body, :on => :create, :message => "can't be blank"
  validates_presence_of :contact
  
  def message_script_body
    message_script.try(:body)
  end
  
  def message_script_body=(body)
    self.message_script = MessageScript.find_or_create_by(body: body) if body.present?
  end
  
  def send_message_to_roster(roster_id:, body: "", user_name: "")
    message_body      = "#{body} - from #{user_name} and EVO Agent"
    
    contacts = Roster.find(roster_id).contacts.select(:id, :primary_phone)
    contacts.each do |contact|
      message = Message.create!(body: message_body, contact_id: contact.id, title: message_body.truncate(20))
      # self.dispatch_message_at_the_scheduled_time(message)
    end
  end
  
  def self.dispatch_message_at_the_scheduled_time(message)
    if message.created_at >= message.dispatched_at
      ContactTexter.immediate_release(message: message, phone_number: message.contact.primary_phone)
        .deliver_later        
    else
      ContactTexter.immediate_release(message: message, phone_number: message.contact.primary_phone)
        .deliver_later(:wait_until => message.dispatched_at)
    end
    
  end
  #broadcast methods
  # This API routine will attempt to create new messages 
  # from multiple JSON records 
  
  def self.create_roster_broadcast(post_content) 
    # begin exception handling 
    begin 
      # begin a transaction on the message model 
    Message.transaction do 
      # for each message record in the passed json 
      JSON.parse(post_content).each do |message_hash| 
        
        message = Message.where(id: message_hash["id"])
        
        if message.count == 1
          # update the existing message record 
          message.first.update_attributes(message_hash) 
        end # message.count
      end # JSON.parse 
    end #transaction 
  rescue
    Rails.logger.info("Did not create messages for broadcast") 
    # do nothing 
  end # exception handling
 end # batch_update
end
