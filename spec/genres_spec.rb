require File.dirname(__FILE__) + '/spec_helper'

describe Trakt do
  describe Trakt::Genres do
    let(:trakt) do
      details = get_account_details
      trakt          = Trakt.new :apikey => details['apikey'],
        :username => details['username'],
        :password => details['password']
      trakt
    end
    it "should get movie genres" do
      result = record(self) do
        trakt.genres.movies
      end
      names = result.inject({}) { |sum,obj| sum[obj['name']] = obj['slug']; sum }
      names['War'].should == 'war'
    end
    it "should get show genres" do
      result = record(self) do
        trakt.genres.shows
      end
      names = result.inject({}) { |sum,obj| sum[obj['name']] = obj['slug']; sum }
      names['Western'].should == 'western'
    end
  end
end
