class ContactCourierJob < ApplicationJob
  queue_as :default

  def perform(params:, phone_number:)
    # Do something later
    ContactTexter.immediate_release(params: params, phone_number: phone_number).deliver
  end
end
