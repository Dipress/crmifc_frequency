class Hardware
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  has_many :base_stations
  has_many :devices

  field :billing_hardware_id, type: Integer
  field :name, type: String
end
