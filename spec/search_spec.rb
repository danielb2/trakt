require File.dirname(__FILE__) + '/spec_helper'

describe Trakt do
  describe Trakt::Search do
    let(:trakt) do
      details = get_account_details
      trakt          = Trakt.new :apikey => details['apikey'],
        :username => details['username'],
        :password => details['password']
      trakt
    end
    it "should find movie uncle buck" do
      result = trakt.search.movies("uncle buck").first
      result['title'].should == 'Uncle Buck'
      result['year'].should == 1989
      result['imdb_id'].should == 'tt0098554'
    end
    it "should find show cowboy bebop" do
      result = trakt.search.shows("cowboy bebop").first
      result['title'].should == 'Cowboy Bebop'
      result['year'].should == 1998
      result['imdb_id'].should == 'tt0213338'
    end
    it "should find episode Lisa the Vegetarian" do
      result = trakt.search.episode("lisa the vegetarian").first
      result['show']['title'].should == 'The Simpsons'
      result['episode']['title'].should == 'Lisa the Vegetarian'
      result['show']['year'].should == 1989
      result['show']['imdb_id'].should == 'tt0096697'
    end
    it "should find actor Eric Bana" do
      result = trakt.search.people("eric bana").first
      result['name'].should == 'Eric Bana'
      result['birthplace'].should == 'Melbourne, Australia'
    end
    it "should find user infodump" do
      result = trakt.search.users("infodump").first
      result['username'].should == 'infodump'
      result['joined'].should == 1320907373
    end
  end
end
