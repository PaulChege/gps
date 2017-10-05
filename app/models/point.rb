class Point < ApplicationRecord
  require 'csv'

  @distance

def set_distance(num)
@distance=num
end

  def distance
    return @distance
  end

  HEADER_MAP = {
      "Point" => :point,
      "Latitude" => :latitude,
      "Longitude" => :longitude
  }

  HEADER_CONVERTER = ->(header) {
    HEADER_MAP.fetch(header, header).to_sym
  }

  def self.import(file)
    CSV.foreach(file.path,headers:true,header_converters: HEADER_CONVERTER) do |row|
      Point.create! row.to_hash
    end

  end

  def self.search(lat,lon)
    @distance_hash = {}
    @points= Point.all
    @points.each do |point|
      @dlat = (point.latitude-Float(lat))* Math::PI / 180
      @dlon = (point.longitude-Float(lon))* Math::PI / 180

      a = Math::sin(@dlat / 2) * Math::sin(@dlat / 2) + (
          Math::sin(@dlon / 2) * Math::sin(@dlon / 2) * Math::cos(Float(lat)*Math::PI / 180) * Math::cos(point.latitude * Math::PI / 180))
       c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

      point.set_distance(6371*c)
    end
     return @points.sort_by(&:distance).first(5)
  end
end
