class RosterContact < ApplicationRecord
  belongs_to :contact
  belongs_to :roster

  accepts_nested_attributes_for :contact, :reject_if => :all_blank
end
