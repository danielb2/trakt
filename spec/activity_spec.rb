require File.dirname(__FILE__) + '/spec_helper'

describe Trakt do
  describe Trakt::Activity do
    let(:trakt) do
      details = get_account_details
      trakt          = Trakt.new :apikey => details['apikey'],
        :username => details['username'],
        :password => details['password']
      trakt
    end
    context "community" do
      it "should get community activity" do
        result = trakt.activity.community("movie","watching", (Time.now - 300).to_i)
        result['activity'].count.should > 0
      end
    end
  end
end
