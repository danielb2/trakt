require File.dirname(__FILE__) + '/spec_helper'

describe Trakt do
  before do
    details = get_account_details
    Trakt.set :apikey, details['apikey']
    Trakt.set :username, details['username']
    Trakt.set :password, details['password']
  end
  describe Trakt::Calendar do
    context "premieres" do
      it "should get premieres" do
        result = Trakt::Calendar.premieres(20110421, 1)
        result.first['episodes'].first['show']['title'].should == "24 Hour Restaurant Battle"
      end
    end
    context "shows" do
      it "should get shows" do
        result = Trakt::Calendar.shows(20110416, 1)
        result.first['episodes'].first['show']['title'].should == "Gosick"
      end
    end
  end
end
