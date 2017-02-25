class Roster < ApplicationRecord
  belongs_to  :user
  has_many    :listings
  has_many    :contacts, through: :listings
  
  accepts_nested_attributes_for :listings
  
  has_many :roster_contacts, inverse_of: :roster
  has_many :contacts, :through => :roster_contacts, :class_name => 'Contact'
  accepts_nested_attributes_for :contacts
  accepts_nested_attributes_for :roster_contacts, :allow_destroy => true
  
  
  
  
end
