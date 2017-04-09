class Broadcast < ApplicationRecord
  acts_as_taggable
  
  belongs_to :user
  belongs_to :roster
  belongs_to :message_script

  
  def self.dispatch_later(broadcast)
    #schedules a broadcast for the future
    puts "Scheduling Dispatch for #{dispatch_datetime}"
  end
  
  def self.dispatch(broadcast_id)
    broadcast = Broadcast.find(broadcast_id)
    puts "Dispatching #{broadcast.dispatched_at}"
    roster = Roster.find(broadcast.roster_id)
    message = self.set_what_and_when_of_message(broadcast)
    #
    self.disseminate_message(message: message, roster: roster)
  end
  
  def self.cue_to_dispatch(broadcast)
    #determines when to send
    self.dispatch(broadcast)
  end
  
  def self.disseminate_message(message:, roster:)
    
    ##
    ## !! roster needs to be replaced with taggings, ex:  Broadcast.all.tagged_with("family")
    ##
    #update message title and body
    roster.contacts.each do |contact|
      puts "#{contact.first_name}"
      # Create message
      # Message.dispatch_message_at_the_scheduled_time(message)
      message.contact_id = contact.id
      puts "!!! Message #{message.to_h} !!!"
      @message = Message.create!(message.to_h)
      Message.dispatch_message_at_the_scheduled_time(@message)
    end
  end
    
  def self.collect_broadcast_message_attributes(broadcast)
    message_attributes = OpenStruct.new(body: broadcast.message_body, 
                          title:              broadcast.message_title, 
                          message_script_id:  broadcast.message_script_id,
                          dispatched_at:      broadcast.dispatched_at,
                          user_id:            broadcast.user_id)
  end
  
  def self.set_what_and_when_of_message(broadcast)
    message_attributes = self.collect_broadcast_message_attributes(broadcast)
    script_id = message_attributes.message_script_id.to_i
    if message_attributes.body.length < 2
      message_attributes.title  = broadcast.message_script.title
      message_attributes.body   = broadcast.message_script.body
    else
      # keep original message and title from user
    end
    result = message_attributes
  end
  
  def self.basic_contact_tag_list
	  tags = ActsAsTaggableOn::Tag.all.where('basic = ?', true).order(:name)
    
  end
end
