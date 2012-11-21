require "rspec"
require "trakt"
require "awesome_print"
require "yaml"
require "vcr"

def get_account_details
  account = IO.read File.dirname(__FILE__) + '/account_details.yml'
  YAML.load(account)
end


VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.allow_http_connections_when_no_cassette = true
  c.hook_into :excon
end

def record(spec,&block)
  VCR.use_cassette(spec.example.description) do
    return yield
  end
end

