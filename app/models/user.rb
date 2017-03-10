class User < ActiveRecord::Base
  self.table_name = 'user'
  self.primary_key = 'id'

  devise :database_authenticatable

  def self.authenticate(username, password)
    User::BillingAuthenticator.new(username, password).authenticate
  end
end
