module Devise
  module Strategies
    class BillingAuthenticatable < Devise::Strategies::Authenticatable
      def valid?
        params[:user].present? && params[:user][:email].present? && params[:user][:password].present?
      end

      def authenticate!
        u = User.authenticate(params[:user][:email], params[:user][:password]) 
        u.nil? ? fail!("Could not log in") : success!(u)
      end
    end
  end
end
