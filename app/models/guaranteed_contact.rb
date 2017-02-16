class GuaranteedContact
  
  def self.find(id)
    Contact.find(id) || MissingContact.new
  end
  
  def self.find_by_email(email)
    Contact.find_by(email_address: email) || MissingContact.new
  end
end