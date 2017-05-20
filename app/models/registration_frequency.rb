class RegistrationFrequency
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  has_many :base_stations

  field :name, type: String
end
