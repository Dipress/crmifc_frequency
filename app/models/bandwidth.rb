class Bandwidth
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  has_many :devices

  field :name, type: String
end
