class Broadcast < ApplicationRecord
  belongs_to :user
  belongs_to :roster
  belongs_to :message_script

  validates_presence_of :user, :on => :create, :message => "can't be blank"
  validates_presence_of :roster, :on => :create, :message => "can't be blank"
end
