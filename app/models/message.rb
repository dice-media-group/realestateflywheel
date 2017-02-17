class Message < ApplicationRecord
  belongs_to :contact
  belongs_to :user
  
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :contact
  
  
end
