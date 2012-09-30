require File.dirname(__FILE__) + '/spec_helper'

describe Trakt do
  before do
    details = get_account_details
    Trakt.set :apikey, details['apikey']
    Trakt.set :username, details['username']
    Trakt.set :password, details['password']
  end
  describe Trakt::Account do
    it "should get account info" do
      result = Trakt::Account.settings
      result['message'].should == "All settings for #{Trakt.settings[:username]}"
    end
    it "should preform an account test" do
      result = Trakt::Account.test
      result['message'].should == "all good!"
    end
  end
end
