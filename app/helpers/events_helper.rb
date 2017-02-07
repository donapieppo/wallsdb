module EventsHelper
  COLORS = %w(#ffca28 #009688 #90a4ae)
  # COLORS = %w(#dddfd4 #fae596 #3fb0ac )
  # COLORS = %w( #dbe9d8 #c2d4d8 #f2efe8 #b0aac2 )
  # COLORS = %w(#8ea9e8 #8d82c4 #e7b788)
  # COLORS = %w(#8bacbd #dbc19c #f75155)
  def event_bg_color
    @i ||= -1
    COLORS[(@i += 1) % COLORS.size]
  end

end


