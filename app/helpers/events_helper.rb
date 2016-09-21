module EventsHelper
  COLORS = %w(#8bacbd #dbc19c #f75155)
  def event_bg_color
    @i ||= -1
    COLORS[(@i += 1) % COLORS.size]
  end

  def group_in_4(events)
    res = []
    events.each_with_index do |event, i|
      res[i%4] ||= []
      res[i%4] << event
    end
    res
  end
end


