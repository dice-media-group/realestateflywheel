class Contact < ApplicationRecord
  has_many    :messages
  has_many    :users, through: :messages
  # acts_as_messageable
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
end
