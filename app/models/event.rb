class Event < ApplicationRecord
  belongs_to :wall
  has_many :photos, dependent: :destroy

  validates :name, presence: true

  scope :future,    -> { where('events.end_date >= NOW()').order(:start_date) }
  scope :past,      -> { where('events.end_date < NOW()').order('start_date desc') }
  scope :last_days, -> (num) { where('events.end_date > DATE_SUB(NOW(), INTERVAL ? day)', num) }

  def to_s
    I18n.l(self.start_date) + " " + self.name
  end

  def html_id
    "event_#{self.id}"
  end

end

