class Wall < ApplicationRecord
  belongs_to :province, required: false
  has_many :admins
  has_many :openings
  has_many :photos

  validates :name, uniqueness: true
  validates :province, presence: true

  def to_s
    self.name
  end

  def gmap_address
    "#{self.address} #{self.cap} #{self.city}"
  end

end


