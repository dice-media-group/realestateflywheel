class Courier
  # twilio webapp api
  attr_reader :messages
  attr :client, :messages
  
  
  def initialize(client: Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']))
    @client = client
  end
  
  def send_message(to: "6507418502", body: "Hello there!")
    @message = client.messages.create(
      :from => '+16506514480', 
    	:to => to, 
      body: body
    )
  end

  def send_text_message(to: "6507418502", body: "Hello there!", from: '+16506514480')
    message = client.messages.create(
      from:   self.sanitize(from), 
    	to:     self.sanitize(to), 
      body:   body
    )
  end
  
  
  def sanitize(number)
    "+1" + number.gsub(/$1|\+|\s|\(|\)|\-|\./, '')
  end
  
end