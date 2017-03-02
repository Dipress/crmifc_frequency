class Device
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Slug

  paginates_per 50

  field :contract_id, type: Integer
  field :contract_title, type: String
  field :contract_comment, type: String
  field :login, type: String
  field :frequency, type: String

  slug :contract_id

  validates :login, :frequency, presence: true
end
