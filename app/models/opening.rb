class Opening < ApplicationRecord
  belongs_to :wall

  DAY_NAMES = I18n.t(:"date.day_names")

  def to_s
    if self.wday
      DAY_NAMES[self.wday] + " " + I18n.l(self.time_open, format: :hour) + " - " + I18n.l(self.time_close, format: :hour)
    else
      "ERRORE"
    end
  end
end

