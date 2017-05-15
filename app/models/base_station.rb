class BaseStation
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  has_many :devices

  field :base_station_id, type: Integer
  field :name, type: String
end
