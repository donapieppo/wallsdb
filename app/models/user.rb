class User < ApplicationRecord

  has_many :admins
  has_many :walls, through: :admins

  def to_s
    self.name
  end

  def owns?(what)
    true
  end
end

