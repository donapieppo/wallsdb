class Opening < ApplicationRecord
  belongs_to :wall

  DAY_NAMES = I18n.t(:"date.day_names")

  def to_s
    if self.wday
      DAY_NAMES[self.wday] + " " + self.time_open.to_s + " - " + self.time_close.to_s
    else
      "ERRORE"
    end
  end
end

