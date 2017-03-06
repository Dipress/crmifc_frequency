class User < ActiveRecord::Base
  class BillingAuthenticator
    attr_reader :username, :password

    def initialize(username, password)
      @username = username
      @password = Digest::MD5.hexdigest(password).upcase
    end

    def authenticate
      return nil if user.nil?

      user.pswd.eql?(password) ? user : nil
    end

    private

    def user
      @user ||= User.find_by(login: username)
    end
  end
end
