class User < ApplicationRecord

  has_many :admins
  has_many :walls, through: :admins

  def to_s
    self.name
  end

  def owns!(what)
    self.owns?(what) or raise NoAccess
  end

  def owns?(what)
    self.master_of_universe? and return true
    case what
    when Wall
      self.walls.include?(what)
    when Opening
      self.owns?(what.wall)
    end
  end

  def master_of_universe?
    MASTERS_OF_UNIVERSE.include?(self.email)
  end
end

