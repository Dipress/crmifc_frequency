class Contract < ActiveRecord::Base
  self.table_name =  "contract"
  self.primary_key = "id"

  has_many :contract_parameter_type1, class_name: 'ContractParameterType1', foreign_key: 'cid'
  has_many :inet_services, class_name: 'InetService', foreign_key: 'contractId'
end