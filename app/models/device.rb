class Device
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Slug

  paginates_per 25

  belongs_to :base_station
  belongs_to :firmware
  belongs_to :registration_frequency
  belongs_to :actual_frequency
  belongs_to :bandwidth
  belongs_to :antenna_type

  field :contract_id, type: Integer
  field :contract_title, type: String
  field :contract_comment, type: String
  field :login, type: String
  field :frequency, type: String
  field :mac, type: String
  field :hardware, type: String
  field :azimut, type: String

  slug :contract_id

  validates :login, :frequency, presence: true
  validates :hardware, presence: true
end
