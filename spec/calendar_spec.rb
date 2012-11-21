require File.dirname(__FILE__) + '/spec_helper'

describe Trakt do
  describe Trakt::Calendar do
    let(:trakt) do
      details = get_account_details
      trakt          = Trakt.new :apikey => details['apikey'],
        :username => details['username'],
        :password => details['password']
      trakt
    end
    context "premieres" do
      it "should get premieres" do
        result = record(example) do
          trakt.calendar.premieres(20110421, 1)
        end
        result.first['episodes'].first['show']['title'].should == "24 Hour Restaurant Battle"
      end
    end
    context "shows" do
      it "should get shows" do
        result = record(example) do
          trakt.calendar.shows(20110416, 1)
        end
        result.first['episodes'].first['show']['title'].should == "Gosick"
      end
    end
  end
end
