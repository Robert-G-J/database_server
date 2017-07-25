require 'sinatra/base'

class DatabaseServer < Sinatra::Base

  server_data = {}
  
  get '/get' do
    server_data[params[:key]]  
  end
  
  post '/set' do
    server_data.merge!(params)
  end
end
