class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # acts_as_messageable
         
  has_many :message_scripts,  :dependent => :destroy
  has_many :contacts,         :dependent => :destroy
  has_many :messages
  has_many :rosters,          :dependent => :destroy


  ## does hmt fit this when we want the dependent attribute?
  # has_many :contacts,         through: :messages
  
  
  def name
    "#{self.first_name} #{self.last_name}"
  end

  def mailboxer_email(object)
    email
  end
         
end
