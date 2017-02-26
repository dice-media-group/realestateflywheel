class Contact < ApplicationRecord
  validates_presence_of :primary_phone, :on => :create, :message => "can't be blank"
  validates_presence_of :primary_phone_kind, :on => :create, :message => "can't be blank"
  validates_presence_of :primary_phone, :on => :update, :message => "can't be blank"
  validates_presence_of :primary_phone_kind, :on => :update, :message => "can't be blank"
  has_many    :messages
  has_many    :milestones
  has_many    :photos
  accepts_nested_attributes_for :photos
  accepts_nested_attributes_for :milestones
  # has_many :parts , inverse_of: :machine
  # accepts_nested_attributes_for :parts
  
  # accepts_nested_attributes_for :photos, :milestones, allow_destroy: true
  
  has_many    :users, through: :messages
  
  # has_many    :listings
  # has_many    :rosters, through: :listings
  
  has_many :roster_contacts, inverse_of: :contact
  has_many :rosters, through: :roster_contacts
  # acts_as_messageable

  # mount_uploader :image, ImageUploader
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
end
