class BaseStation
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  paginates_per 25

  has_many :devices
  belongs_to :firmware
  belongs_to :registration_frequency
  belongs_to :actual_frequency
  belongs_to :bandwidth
  belongs_to :antenna_type
  belongs_to :hardware

  field :billing_station_id, type: Integer
  field :name, type: String
  field :nagios, type: String
  field :ssid, type: String
  field :azimut, type: String
  field :correct, type: Boolean, default: false
  field :mac, type: String
  field :note, type: String
end
