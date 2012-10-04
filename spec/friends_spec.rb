require File.dirname(__FILE__) + '/spec_helper'

describe Trakt do
  before do
    details = get_account_details
    Trakt.set :apikey, details['apikey']
    Trakt.set :username, details['username']
    Trakt.set :password, details['password']
  end
  describe Trakt::Account do
    it "add username" do
      pending
      result = Trakt::Friends.add 'snowfall'
      result['message'].should == "snowfall added, pending their approval"
    end
  end
end
