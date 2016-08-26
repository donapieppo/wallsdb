class Region < ApplicationRecord
  has_many :provinces

  def to_s
    self.name
  end
end
