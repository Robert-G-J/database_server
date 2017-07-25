require 'rack/test'
require 'server'

RSpec.describe "DatabaseServer" do
  include Rack::Test::Methods
  
  def app
    DatabaseServer
  end

#----------------------------------  

  describe "GET requests" do
    it "responds with text" do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to eq 'Database Server'
    end
  end
end

