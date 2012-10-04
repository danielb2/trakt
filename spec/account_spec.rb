require File.dirname(__FILE__) + '/spec_helper'

describe Trakt do
  describe Trakt::Account do
    let(:trakt) do
      details = get_account_details
      trakt          = Trakt.new :apikey => details['apikey'],
        :username => details['username'],
        :password => details['password']
      trakt
    end
    it "should get account info" do
      result = trakt.account.settings
      result['message'].should == "All settings for #{trakt.username}"
    end
    it "should preform an account test" do
      result = trakt.account.test
      result['message'].should == "all good!"
    end
  end
end
