module WallsHelper
  def boulder_presence(wall)
    present = (wall.boulder_mq.to_i > 0)
    content_tag :li, class: (present ? '' : 'absent') do
      big_icon('flag') + "<br/>".html_safe +
      (present ? "#{wall.boulder_mq} m.q. di boulder" : "boulder")
    end
  end

  def rope_presence(wall)
    present = (wall.rope_mq.to_i > 0)
    content_tag :li, class: (present ? '' : 'absent') do
      big_icon('chain') + "<br/>".html_safe +
      (present ? "#{wall.rope_mq} m.q. di corda" : "parete con corda")
    end
  end

  def training_presence(wall)
    present = ! wall.training.blank?
    content_tag :li, class: (present ? '' : 'absent')  do
      big_icon('bomb') + "<br/>".html_safe + h(wall.training)
    end
  end

  def bar_presence(wall)
    present = ! wall.bar.blank?
    content_tag :li, class: (present ? '' : 'absent')  do
      big_icon(:beer) + "<br/>".html_safe + "Bar"
    end
  end

  def music_presence(wall)
    present = ! wall.music.blank?
    content_tag :li, class: (present ? '' : 'absent')  do
      big_icon(:music) + "<br/>".html_safe + "Musica"
    end
  end
end  
