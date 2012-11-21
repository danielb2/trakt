require File.dirname(__FILE__) + '/spec_helper'

describe Trakt do
  describe Trakt::Show do
    let(:trakt) do
      details = get_account_details
      trakt          = Trakt.new :apikey => details['apikey'],
        :username => details['username'],
        :password => details['password']
      trakt
    end
    it "should see an episode" do

      result =  record(self) do
        trakt.show.episode_seen title: 'The Big Bang Theory',
          year: 2007,
          episodes: [{
          season: 1,
          episode: 1
        }]
      end
      result['status'].should == 'success'
      result['message'].should == '1 episodes marked as seen'
    end
    it "should unsee an episode" do
      result =  record(self) do
        trakt.show.episode_unseen title: 'The Big Bang Theory',
          year: 2007,
          episodes: [{
          season: 1,
          episode: 1
        }]
      end
      result['status'].should == 'success'
      result['message'].should == '1 episodes removed as seen'
    end
    it "should see a whole show" do
      result = trakt.show.seen title: 'The Big Bang Theory', year: 2007
      result['status'].should == 'success'
      result['message'].should =~ /\d episodes marked as seen/
      trakt.show.unseen '80379' # use thetvdbid code for big bang theory here
    end
    it "should list seasons for a show" do
      result =  record(self) do
        trakt.show.seasons 'the-big-bang-theory'
      end
      result.count.should > 6 # currently more than 6 season. lame test, but ... 
    end
  end
end
