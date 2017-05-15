class User < ApplicationRecord
  acts_as_tagger
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :trackable, 
          :validatable,
          :omniauthable, :omniauth_providers => [:facebook]

  # acts_as_messageable
         
  has_many :message_scripts,  :dependent => :destroy
  has_many :contacts,         :dependent => :destroy
  has_many :messages
  has_many :rosters,          :dependent => :destroy
  has_many :broadcasts,       :dependent => :destroy
  has_many :charges


  ## does hmt fit this when we want the dependent attribute?
  # has_many :contacts,         through: :messages
  
  def subscribed?
    stripe_subscription_id?
  end
   
  def name
    "#{self.first_name} #{self.last_name}"
  end

  def mailboxer_email(object)
    email
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      puts auth.info
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end         
end
