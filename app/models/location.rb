class Location
  include Mongoid::Document

  field :lat, type: String
  field :lng, type: String
  field :at, type: DateTime

  belongs_to :vehicle
end
