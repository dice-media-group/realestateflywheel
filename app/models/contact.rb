class Contact < ApplicationRecord
  acts_as_taggable
  
  ## validations
  validates_presence_of :primary_phone, :on => :create, :message => "can't be blank on creation"
  validates_presence_of :primary_phone_kind, :on => :create, :message => "can't be blank"
  validates_presence_of :primary_phone, :on => :update, :message => "can't be blank on update"
  validates_presence_of :primary_phone_kind, :on => :update, :message => "can't be blank"
  
  ## relationships
  has_many    :messages
  has_many    :milestones
  has_many    :photos
  belongs_to  :user
  
  ## nesting
  accepts_nested_attributes_for :photos
  accepts_nested_attributes_for :milestones
  
  
  ## possible cruft to be reviewed during refactor
  # has_many :parts , inverse_of: :machine
  # accepts_nested_attributes_for :parts
  
  # accepts_nested_attributes_for :photos, :milestones, allow_destroy: true
  
  # has_many    :users, through: :messages
  
  # acts_as_messageable

  # mount_uploader :image, ImageUploader
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
  
  def current_user_tagged_contacts(tag_name)
    current_user.contacts.tagged_with([tag_name], :match_any => true) 
  end
  
  def self.current_user_contacts
    current_user.contacts
  end
  
  def self.add_owned_tags(contact:, tag_list:, user:) 
      owned_tag_list = contact.all_tags_list - contact.tag_list
      owned_tag_list += Array(tag_list)
      user.tag(contact, :with => self.stringify(owned_tag_list), :on => :tags)
      contact.save   
  end

  def self.stringify(tag_list)
      tag_list.inject('') { |memo, tag| memo += (tag + ',') }[0..-1]
  end
  
end
