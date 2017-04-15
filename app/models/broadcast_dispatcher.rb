class BroadcastDispatcher
  attr_accessor :broadcast
  
  def initialize(broadcast:)
    @broadcast = broadcast
  end
  
  def send
    _disseminate_message_to_contacts  
  end
  
  def _collect_contacts_to_receive_broadcast(roster_tags: Array(@broadcast.tag_list))
    #guard against empty tags
    roster_tags = roster_tags.reject(&:empty?)
   
    # # create the collection
    contacts_to_receive_broadcast = Contact.tagged_with(roster_tags, :on => :tags, :any => true, :owned_by => broadcast.user)
    result = contacts_to_receive_broadcast
  end

  def _disseminate_message_to_contacts(msg: _assemble_message_with_dispatch_time, contacts: _collect_contacts_to_receive_broadcast(roster_tags: Array(broadcast.tag_list)))
    # objects resulting should culminate in some sort of object to test
    messaged_contacts = []
    contacts.each do |contact|
      # Create the message with the contact as the owner
      @msg = contact.messages.create!(msg.to_h)
      # Message.dispatch_message_at_the_scheduled_time(@msg)
      messaged_contacts << [contact, @msg] #OpenStruct.new(@msg, contact)
    end
    messaged_contacts
  end
  
  def _collect_broadcast_message_attributes
    # message_attributes   = OpenStruct.new(body: broadcast.id
    # )
    message_attributes = OpenStruct.new(body: broadcast.message_body,
                          title:              broadcast.message_title,
                          message_script_id:  broadcast.message_script_id,
                          dispatched_at:      broadcast.dispatched_at,
                          user_id:            broadcast.user_id
    )
  end
  
  def _assemble_message_with_dispatch_time
    message_attributes = _collect_broadcast_message_attributes
    
    script_id = message_attributes.message_script_id.to_i
    if message_attributes.body.length < 2 
      # if there is no message, we assume that the user employs a script
      message_attributes.title  = broadcast.message_script.title
      message_attributes.body   = broadcast.message_script.body
    else
      # keep original message and title from user
    end
    result = message_attributes
  end
  
end
