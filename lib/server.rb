require 'sinatra/base'

class DatabaseServer < Sinatra::Base

  get '/get' do
    'somevalue'
  end
end
