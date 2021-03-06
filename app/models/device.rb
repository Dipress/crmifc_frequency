class Device
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Slug

  paginates_per 25

  belongs_to :base_station
  belongs_to :hardware

  field :contract_id, type: Integer
  field :contract_title, type: String
  field :contract_comment, type: String
  field :ip, type: String
  field :login, type: String
  field :frequency, type: String
  field :mac, type: String

  slug :login

  validates :login, :frequency, :ip, presence: true
end
