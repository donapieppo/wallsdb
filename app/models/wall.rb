class Wall < ApplicationRecord
  belongs_to :admin, required: false
  belongs_to :province, required: false
  has_many :openings
  has_many :photos

end


