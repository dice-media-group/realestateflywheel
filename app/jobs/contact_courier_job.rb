class ContactCourierJob < ApplicationJob
  queue_as :default

  def perform_now(message: , phone_number:)
    # Do something later
    # ContactTexter.immediate_release(message: message, phone_number: phone_number).deliver
    ContactTexter.immediate_release(message: message, phone_number: phone_number).deliver_now
    
  end
end
