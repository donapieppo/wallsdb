class Photo < ApplicationRecord
  belongs_to :wall,  required: false
  belongs_to :event, required: false

  mount_uploader :image, ImageUploader

  validates :image, presence: {}

  def self.importaces
    {main: 1, secondary: 2}
  end
end

