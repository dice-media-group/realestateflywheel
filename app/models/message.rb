class Message < ApplicationRecord
  belongs_to :contact
  belongs_to :user
  belongs_to :message_script
  
  # validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :contact
  
  def message_script_body
    message_script.try(:body)
  end
  
  def message_script_body=(body)
    self.message_script = MessageScript.find_or_create_by(body: body) if body.present?
  end
end
