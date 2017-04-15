require 'rails_helper'

RSpec.describe BroadcastDispatcher, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:password)      { "123456789" }
  let(:current_user)  { create( :user, password: password, password_confirmation: password ) }
  let(:broadcast)     { create(:broadcast, user_id: current_user.id) }
  # let(:contacts)     { create(:contact, user_id: current_user.id) }
  
  
  describe '#send' do
    it 'works' do
      # expect(BroadcastDispatcher.new(broadcast: broadcast).send).to eq(["mono", "tag"])
    end
  end
  
  describe '#_collect_contacts_to_receive_broadcast' do
    let(:contact)     { create(:contact, user_id: current_user.id) }
    let(:contacts)    { build_stubbed_list(:contact, 25) }
    
    it 'has a valid contact factory' do
     expect(contact).to be_valid
    end

    it 'has contact tags eq to ["mono", "tag1"]' do
     expect(contact.tag_list).to eq(["mono", "tag1"])
    end

    it 'has broadcast tags eq to ["mono", "tag"]' do
     expect(broadcast.tag_list).to eq(["mono", "tag"])
    end
    
    it 'returns a list of tagged contacts' do
      contact_list = BroadcastDispatcher.new(broadcast: broadcast)
        ._collect_contacts_to_receive_broadcast(roster_tags: Array(broadcast.tag_list))
      expect(contact_list).not_to be_empty
      
    end
    
    it 'returns an Array of contacts' do
      contact_list = BroadcastDispatcher.new(broadcast: broadcast)
        ._collect_contacts_to_receive_broadcast(roster_tags: Array(broadcast.tag_list))
      expect(contact_list).to be_kind_of(Array)
            
    end
    
    it 'returns a contact as the first object in the Array' do
      # # contact_list = BroadcastDispatcher.new(broadcast: broadcast)
      # #   ._collect_contacts_to_receive_broadcast(roster_tags: Array(broadcast.tag_list))
      # contact_list = contacts
      #   # expect(contact_list).to be_kind_of(Array)
      #   expect(contact_list).to eq("something")
    end
  end
  
  describe '#_disseminate_message_to_contacts' do
    # message: message, contacts: contacts_to_receive_broadcast
    # # message = broadcast.message
    it 'works' do
      # dispatcher  = BroadcastDispatcher.new(broadcast: broadcast)
      # target      = dispatcher
      #               ._disseminate_message_to_contacts(
      #                 msg: dispatcher._assemble_message_with_dispatch_time,
      #                 contacts: dispatcher._collect_contacts_to_receive_broadcast
      #                 )
      # expect(target).to eq("something")
    end
  end
  
end
