class InetResourceSubscription < ActiveRecord::Base
  self.table_name = "inv_ip_resource_subscription_14"
  belongs_to :inet_service, class_name: 'InetService'

  def human_ip
    addressFrom.bytes.to_a.join('.')
  end
end