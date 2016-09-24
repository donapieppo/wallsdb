class Opening < ApplicationRecord
  belongs_to :wall

  DAY_NAMES = I18n.t(:"date.day_names")

  def to_s
    if self.wday
      wday_to_s + " " + hours_to_s
    else
      "ERRORE"
    end
  end

  def wday_to_s
    DAY_NAMES[self.wday]
  end

  def hours_to_s
    I18n.l(self.time_open, format: :hour) + " - " + I18n.l(self.time_close, format: :hour)
  end
end

