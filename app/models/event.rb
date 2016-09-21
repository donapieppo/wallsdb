class Event < ApplicationRecord
  belongs_to :wall
  has_many :photos

  validates :name, presence: true
  validates :start_date, presence: true

  def to_s
    I18n.l(self.start_date) + " " + self.name
  end

  def html_id
    "event_#{self.id}"
  end
end

