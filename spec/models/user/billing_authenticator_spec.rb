require 'rails_helper'

RSpec.describe User::BillingAuthenticator do
  let(:password) { '123456789' }
  let(:digest) { Digest::MD5.hexdigest('123456789').upcase }

  before do
    allow(User).to receive('find_by').and_return(OpenStruct.new(pswd: digest))
  end

  context '.authenticate' do
    it 'should authenticate user with corrent password' do
      expect(User.authenticate('Any', password)).to_not be_nil
    end

    it 'shouldn\'t authenticate user with wrong password' do
      expect(User.authenticate('Any', 'wrong')).to be_nil
    end
  end
end
