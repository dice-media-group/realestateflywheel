class Contact < ApplicationRecord
  has_many    :messages
  has_many    :milestones
  has_many    :photos
  accepts_nested_attributes_for :photos
  accepts_nested_attributes_for :milestones
  # has_many :parts , inverse_of: :machine
  # accepts_nested_attributes_for :parts
  
  # accepts_nested_attributes_for :photos, :milestones, allow_destroy: true
  
  has_many    :users, through: :messages
  # acts_as_messageable

  # mount_uploader :image, ImageUploader
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
end
