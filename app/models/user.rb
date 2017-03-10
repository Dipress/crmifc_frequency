class User < ActiveRecord::Base
  self.table_name = 'user'
  self.primary_key = 'id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable

  def self.authenticate(username, password)
    User::BillingAuthenticator.new(username, password).authenticate
  end

  def encrypted_password
    pswd
  end
end
