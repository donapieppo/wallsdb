class Event < ApplicationRecord
  belongs_to :wall
  has_many :photos

  def to_s
    I18n.l(self.start_date) + " " + self.name
  end
end

