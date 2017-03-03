class Device
  module Services
    class InetNotFound < StandardError
      def initialize(msg = 'Login not found in module Inet of Bgbilling.')
        super
      end
    end
  end
end
