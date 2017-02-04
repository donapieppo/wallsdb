class Photo < ApplicationRecord
  belongs_to :wall,  required: false
  belongs_to :event, required: false

  mount_uploader :image, ImageUploader

  validates :image, presence: {}

  scope :header, -> { where(importance: 1) }

  def self.importaces
    {main: 1, secondary: 2, logo: 3}
  end

  def height
    ::MiniMagick::Image.open(image.path)[:dimensions][1] 
  end

end

