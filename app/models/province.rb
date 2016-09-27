class Province < ApplicationRecord
  belongs_to :region
  has_many :walls

  # cache, non cambiano mai
  @@provinces_json = Province.order(:name).select(:name).pluck(:name).to_json

  def self.provinces_json
    @@provinces_json
  end
 
  def to_s
    self.name
  end

end

