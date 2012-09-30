require "rspec"
require "trakt"
require "awesome_print"
require "yaml"

def get_account_details
  account = IO.read File.dirname(__FILE__) + '/account_details.yml'
  YAML.load(account)
end
