module Devise
  module Strategies
    class Billing < Base
      def valid? 
        params['username'].present? && params['password'].present?
      end

      def authenticate!
        u = User.authenticate(params['username'], params['password']) 
        u.nil? ? fail!("Could not log in") : success!(u)
      end
    end
  end
end
