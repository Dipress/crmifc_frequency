class Firmware
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  has_many :devices

  field :name, type: String
end
