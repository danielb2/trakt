require File.dirname(__FILE__) + '/spec_helper'

describe Trakt do
  describe Trakt::Friends do
    let(:trakt) do
      details = get_account_details
      trakt          = Trakt.new :apikey => details['apikey'],
        :username => details['username'],
        :password => details['password']
      trakt
    end
    it "add username" do
      pending
      result = trakt.friends.add 'snowfall'
      result['message'].should == "snowfall added, pending their approval"
    end
  end
end
