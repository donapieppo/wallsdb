class Wall < ApplicationRecord
  belongs_to :province, required: false
  has_many :admins
  has_many :openings
  has_many :photos
  has_many :events

  validates :name, presence: true,  uniqueness: true
  validates :province, presence: true
  validates :web, uniqueness: true

  before_save :fill_geocodes
  after_save  :clear_cache

  # allowed_tags = Set.new(%w(strong em b i p code pre tt samp kbd var sub
  #      sup dfn cite big small address hr br div span h1 h2 h3 h4 h5 h6 ul ol li dl dt dd abbr
  #      acronym a img blockquote del ins))
  SANITIZE = Rails::Html::WhiteListSanitizer.new

  def to_s
    self.name
  end

  def gmap_address
    "#{self.address} #{self.cap} #{self.city}"
  end

  def has_boulder?
    self.boulder_mq.to_i > 0
  end

  def has_rope?
    self.rope_mq.to_i > 0
  end

  def has_training?
    ! self.training.blank?
  end

  def has_bar?
    ! self.bar.blank?
  end

  def has_music?
    ! self.music.blank?
  end

  def fill_geocodes
    return true unless (self.address_changed? or self.city_changed? or self.lat.nil?)
    url = "https://maps.googleapis.com/maps/api/geocode/json?"
    url << "address=#{gmap_address},+IT"
    url << "&key=#{ENV['WALLSDB_GOOGLE_MAP_API_KEY']}"
    uri = URI.parse(URI.escape(url))
    response = ActiveSupport::JSON.decode(Net::HTTP.get(uri))
    case response["status"] 
    when "OK"
      res = response["results"]
      # "geometry"=>{"location"=>{"lat"=>44.5149894, "lng"=>11.3592175}
      lat_lng = res[0]["geometry"]["location"]
      self.lat = lat_lng["lat"]
      self.lng = lat_lng["lng"]
    when "ZERO_RESULTS"
      self.errors.add(:address, message: "Indirizzo sconosciuto su google map")
    else
      self.errors.add(:address, message: "Indirizzo sconosciuto su google map")
    end
  end

  def self.addresses 
    self.includes(:province).map {|wall| "#{wall.address}, #{wall.city}, #{wall.province.name}"}
  end

  def self.geocodes
    self.all.map {|wall| [wall.lat, wall.lng, wall.name, wall.id]}
  end

  def clear_cache
    Wall.reload_walls_json
  end

  def self.reload_walls_json
    @@walls_json = Wall.select(:name).pluck(:name).to_json
  end

  def self.walls_json
    defined?(@@walls_json) ? @@walls_json : reload_walls_json
  end
end

# https://developers.google.com/maps/documentation/geocoding/intro
#  => {"results"=>[{"address_components"=>[{"long_name"=>"59", "short_name"=>"59", "types"=>["street_number"]}, {"long_name"=>"Via Stalingrado", "short_name"=>"Via Stalingrado", "types"=>["route"]}, {"long_name"=>"Bologna", "short_name"=>"Bologna", "types"=>["locality", "political"]}, {"long_name"=>"Bologna", "short_name"=>"Bologna", "types"=>["administrative_area_level_3", "political"]}, {"long_name"=>"Città Metropolitana di Bologna", "short_name"=>"BO", "types"=>["administrative_area_level_2", "political"]}, {"long_name"=>"Emilia-Romagna", "short_name"=>"Emilia-Romagna", "types"=>["administrative_area_level_1", "political"]}, {"long_name"=>"Italy", "short_name"=>"IT", "types"=>["country", "political"]}, {"long_name"=>"40128", "short_name"=>"40128", "types"=>["postal_code"]}], "formatted_address"=>"Via Stalingrado, 59, 40128 Bologna, Italy", "geometry"=>{"location"=>{"lat"=>44.5149894, "lng"=>11.3592175}, "location_type"=>"ROOFTOP", "viewport"=>{"northeast"=>{"lat"=>44.51633838029149, "lng"=>11.3605664802915}, "southwest"=>{"lat"=>44.5136404197085, "lng"=>11.3578685197085}}}, "partial_match"=>true, "place_id"=>"ChIJL_11ClvTf0cRoto9Fx2UqD0", "types"=>["street_address"]}], "status"=>"OK"} 
#
