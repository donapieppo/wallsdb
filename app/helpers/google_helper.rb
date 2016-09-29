module GoogleHelper
  def simple_gmap_url(address)
    "//www.google.com/maps/embed/v1/place?key=#{ENV['WALLSDB_GOOGLE_MAP_API_KEY']}&q=#{h address}&scrollwheel=false".html_safe
  end
end

