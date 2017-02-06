class Contact < ApplicationRecord
  belongs_to  :user
  has_many    :messages
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
end
