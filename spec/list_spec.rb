require File.dirname(__FILE__) + '/spec_helper'

describe Trakt do
  describe Trakt::List do
    before do
      list = trakt.list.get("testlist")
      list.delete rescue nil
    end
    let(:trakt) do
      details = get_account_details
      trakt          = Trakt.new :apikey => details['apikey'],
        :username => details['username'],
        :password => details['password']
      trakt
    end
    it "should add a list" do
      list = trakt.list.add("test-list")
      list.add_info['status'].should == 'success'
      lambda { trakt.list.add("test-list") }.should raise_error("a list already exists with this name")
    end
    it "should get a list" do
      list = trakt.list.get("testlist")
      list.slug.should == 'testlist'
    end
    it "should add a movie" do
      list = trakt.list.add("test-list")
      result = list.add_item :type => :movie, :imdb_id => 'tt0098554'
      result['status'].should == 'success'
      result['inserted'].should == 1
    end
    it "should add movies" do
      list = trakt.list.add("test-list")
      result = list.add_items [{:type => :movie, :imdb_id => 'tt0098554'}, {:type => :movie, :imdb_id => 'tt0111161'}]
      result['status'].should == 'success'
      result['inserted'].should == 2
    end
    it "should delete list" do
      list = trakt.list.add("test-list")
      result = list.delete
      result['status'].should == 'success'
      result['message'].should == 'list and items deleted'
    end
    it "should delete an item" do
      list = trakt.list.add("test-list")
      list.add_items [{:type => :movie, :imdb_id => 'tt0098554'}, {:type => :movie, :imdb_id => 'tt0111161'}]
      result = list.delete_item :type => :movie, :imdb_id => 'tt0098554'
      result['status'].should == 'success'
      result['message'].should == '1 items deleted'
    end
    it "should delete items" do
      list = trakt.list.add("test-list")
      list.add_items [{:type => :movie, :imdb_id => 'tt0098554'}, {:type => :movie, :imdb_id => 'tt0111161'}]
      result = list.delete_items [{:type => :movie, :imdb_id => 'tt0098554'}, {:type => :movie, :imdb_id => 'tt0111161'}]
      result['status'].should == 'success'
      result['message'].should == '2 items deleted'
    end
    it "should update list" do
      list = trakt.list.add("test-list", 'show_numbers' => true)
      list.add_info['show_numbers'].should == true
      result = list.update('show_numbers' => false)
      result['status'].should == 'success'
      result['show_numbers'].should == false
    end
  end
end
