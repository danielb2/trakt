require File.dirname(__FILE__) + '/spec_helper'

describe Trakt do
  before do
    details = get_account_details
    Trakt.set :apikey, details['apikey']
    Trakt.set :username, details['username']
    Trakt.set :password, details['password']
  end
  describe Trakt::Movie do
    it "should find uncle buck" do
      result = Trakt::Movie.find("uncle buck").first
      result['title'].should == 'Uncle Buck'
      result['year'].should == 1989
      result['imdb_id'].should == 'tt0098554'
    end
  end

  describe Trakt::Account do
    it "should get account info" do
      result = Trakt::Account.settings
      result['message'].should == "All settings for #{Trakt.settings[:username]}"
    end
  end
end
