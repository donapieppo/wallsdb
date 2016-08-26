class Photo < ApplicationRecord
  belongs_to :wall

  mount_uploader :image, ImageUploader
end

