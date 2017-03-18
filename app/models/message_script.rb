class MessageScript < ApplicationRecord
  belongs_to :user
  has_many   :messages
  
  validates_presence_of :title
  validates_presence_of :body
end
