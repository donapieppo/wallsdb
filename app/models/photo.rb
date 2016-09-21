class Photo < ApplicationRecord
  belongs_to :wall,  required: false
  belongs_to :event, required: false

  mount_uploader :image, ImageUploader

  validates :image, presence: {}
end

