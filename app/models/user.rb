class User < ApplicationRecord

  has_many :admins
  has_many :walls, through: :admins

end

