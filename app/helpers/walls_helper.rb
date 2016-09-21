module WallsHelper

  WallIcons = { boulder:  'flag',
                rope:     'chain', 
                training: 'bomb', 
                bar:      'beer',
                music:    'music' }


  def details_bar(wall)
    content_tag :ul, class: "wall-circles" do
      capture do
        concat li_tag(wall, :boulder) 
        concat li_tag(wall, :rope)
        concat li_tag(wall, :training)
        concat li_tag(wall, :bar)
        concat li_tag(wall, :music)
      end
    end
  end

  def li_tag(wall, what)
    present = wall.send("has_#{what}?")        
    mq      = [:boulder, :rope].include?(what) ? wall.send("#{what}_mq")    : nil
    notes   = [:boulder, :rope].include?(what) ? wall.send("#{what}_notes") : wall.send(what)

    popover = present ? { toggle: "popover", content: notes, container: "body", placement: "bottom"} : ''

    content_tag :li, class: (present ? '' : 'absent'), data: popover, title: t(what) do 
      icon(WallIcons[what], size: 38) +
      "<br/>".html_safe +
      (mq ? "#{mq} m.q. di #{t what}" : t(what))
    end
  end

end  
