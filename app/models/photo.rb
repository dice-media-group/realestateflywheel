class Photo < ApplicationRecord
  belongs_to :contact
  
  mount_uploader :image, ImageUploader  
end
