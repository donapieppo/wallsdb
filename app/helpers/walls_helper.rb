module WallsHelper

  WallIcons = { boulder:  'flag',
                rope:     'chain', 
                training: 'bomb', 
                bar:      'beer',
                music:    'music' }


  def details_bar(wall)
    content_tag :div, class: "wall-details" do
      capture do
        concat wall_detail(wall, :boulder) 
        concat wall_detail(wall, :rope)
        concat wall_detail(wall, :training)
        concat wall_detail(wall, :bar)
        concat wall_detail(wall, :music)
      end
    end
  end

  def wall_detail(wall, what)
    present = wall.send("has_#{what}?")        
    mq      = [:boulder, :rope].include?(what) ? wall.send("#{what}_mq")    : nil
    notes   = [:boulder, :rope].include?(what) ? wall.send("#{what}_notes") : wall.send(what)

    content_tag :div, class: (present ? 'col ' : 'col absent')  do 
      content_tag :div, class: 'wall-detail' do
        capture do
          content_tag('span') { icon(WallIcons[what], size: 28) } +
          content_tag('h3') { (mq ? "#{mq} m.q. di #{t what}" : t(what)) } +
          content_tag('p') { notes }
        end
      end
    end
  end

end  
