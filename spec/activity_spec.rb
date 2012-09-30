require File.dirname(__FILE__) + '/spec_helper'

describe Trakt do
  before do
    details = get_account_details
    Trakt.set :apikey, details['apikey']
    Trakt.set :username, details['username']
    Trakt.set :password, details['password']
  end
  describe Trakt::Activity do
    context "community" do
      it "should get community activity" do
        pending "dont know how to test this now"
        result = Trakt::Activity.community("movie","watching")
        ap result
      end
    end
  end
end
