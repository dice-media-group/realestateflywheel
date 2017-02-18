class Message < ApplicationRecord
  belongs_to :contact
  belongs_to :user
  belongs_to :message_script
  
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :contact
  
  def message_script_title
    message_script.try(:title)
  end
  
  def message_script_title=(title)
    self.message_script = MessageScript.find_or_create_by(title: title) if title.present?
  end
end
