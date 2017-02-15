class Contact < ApplicationRecord
  belongs_to  :user
  has_many    :messages
  
  acts_as_messageable  
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
end
