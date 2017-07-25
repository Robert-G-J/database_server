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

  describe 'POST requests' do
    it 'stores a key-value pair' do
      make_post_request(post_data)
      expect(last_response.body).to eq(post_data.flatten.to_s)
    end
  end

  describe 'GET requests' do
    it 'return a hardcoded value from memory' do
      make_post_request(post_data) 
      make_get_request(key)
      expect(last_response.body).to eq value
    end

    it 'return nil-string from nil-string key' do
      make_post_request(post_data)
      make_get_request()
      expect(last_response.body).to eq nil.to_s
    end

    it 'return nil-string for unknown key' do
      make_post_request(post_data)
      make_get_request('unknown key')
      expect(last_response.body).to eq nil.to_s
    end
  end

  #-------- Helpers ----------------

  def make_get_request(key = nil.to_s)
    get "/get?key=#{key}"
  end

  def make_post_request(post_data)
    post 'set', post_data
  end
end
