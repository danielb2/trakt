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
    it "should find uncle buck" do
      result =  record(self) do
        result = trakt.search.movies("uncle buck").first
      end
      result['title'].should == 'Uncle Buck'
      result['year'].should == 1989
      result['imdb_id'].should == 'tt0098554'
      VCR.use_cassette('synopsis') do
        response = Excon.get('http://www.iana.org/domains/example/')
      end
    end
  end
end
