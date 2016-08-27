module OpeningHelper
  def select_opening_day
    res = ""
      I18n.t(:"date.day_names").each_with_index do |day, i|
      res += %Q|<input name="wday[]" type="checkbox" value="#{i}" /> #{day}<br/>|
    end 
    raw res
  end

  def select_opening_hour(what)
    res = %Q|<select name="#{what}_hour">|
    (7..22).each do |hour|
       res += %Q|<option value="#{hour}">#{"%02d" % hour}</option>|
    end 
    res += "</select> : "

    res += %Q|<select name="#{what}_min">|
    (00..45).step(15).each do |min|  
      res += %Q|<option value="#{min}">#{"%02d" % min}</option>|
    end
    res += "</select>"

    raw res
  end

end
