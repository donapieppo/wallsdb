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

  def has_boulder?
    self.boulder_mq.to_i > 0
  end

  def has_rope?
    self.rope_mq.to_i > 0
  end

  def has_training?
    ! self.training.blank?
  end

  def has_bar?
    ! self.bar.blank?
  end

  def has_music?
    ! self.music.blank?
  end

  def self.addresses 
    self.includes(:province).map {|wall| "#{wall.address}, #{wall.city}, #{wall.province.name}"}
  end
end


