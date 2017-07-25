require 'rack/test'
require 'server'

RSpec.describe 'DatabaseServer' do
  include Rack::Test::Methods
  
  def app
    DatabaseServer
  end

#----------------------------------  

  let(:key) { "somekey" }
  let(:value) { "somevalue" }
  let(:post_data) { { key => value } }

  describe 'GET requests' do
    it 'return a hardcoded value from memory' do
      make_post_request(post_data) 
      make_get_request(key)
      expect(last_response.body).to eq value
    end
  end

  describe 'POST requests' do
    it 'stores a key-value pair' do
      make_post_request(post_data)
      expect(last_response.body).to eq(post_data.flatten.to_s)
    end
  end
#-------- Helpers ----------------

  def make_get_request(key)
    get "/get?key=#{key}"
  end

  def make_post_request(post_data)
    post 'set', post_data
  end
end
