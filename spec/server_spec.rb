require 'rack/test'
require 'server'

RSpec.describe 'DatabaseServer' do
  include Rack::Test::Methods
  
  def app
    DatabaseServer
  end

#----------------------------------  

  describe 'GET requests' do
    it 'return a hardcoded value from memory' do
      get '/get?key=somekey'
      expect(last_response.body).to eq 'somevalue'
    end
  end

  describe 'POST requests' do
    it 'stores a key-value pair' do
      post 'set', 'somekey' => 'somevalue'
      expect(last_response.body).to eq("[\"somekey\", \"somevalue\"]")
    end
  end
end
