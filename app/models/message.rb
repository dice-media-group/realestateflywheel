class Message < ApplicationRecord
  belongs_to :contact
  belongs_to :user
end
