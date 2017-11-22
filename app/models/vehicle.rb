class Vehicle
  include Mongoid::Document
  field :color, type: String

  has_many :locations
end
