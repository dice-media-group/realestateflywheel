class AgentTexter < Textris::Base
  default :from => ENV["TWILIO_NUMBER"]

  def alert(params)
    @params = params
    text :to => ENV["AGENT_NUMBER"]
  end

  def basic_message(params)
    @params = params
    text :to => ENV["AGENT_NUMBER"]
  end
end
