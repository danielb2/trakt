require File.dirname(__FILE__) + '/spec_helper'

describe Trakt do
  describe Trakt::Movie do
    let(:trakt) do
      details = get_account_details
      trakt          = Trakt.new :apikey => details['apikey'],
        :username => details['username'],
        :password => details['password']
      trakt
    end
    it "should mark twelve monkeys" do
      result = record(self) do
        trakt.movie.seen  movies: [{
          imdb_id: "tt0114746",
          title: "Twelve Monkeys",
          year: 1995,
          plays: 1,
          last_played: 1255960578
        }]
      end
      result['status'].should == 'success'
    end
  end
end
