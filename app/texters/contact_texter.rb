class ContactTexter < Textris::Base
  default :from => ENV["TWILIO_NUMBER"]

  def alert(params)
    @params = params
    text :to => ENV["AGENT_NUMBER"]
  end

  def basic_message(params:, phone_number:)
    @params = params
    text :to => Courier.new.sanitize(phone_number)
  end
  
  def immediate_release(message:, phone_number:)
    @message   = message
    text :to => Courier.new.sanitize(phone_number)
  end
end
