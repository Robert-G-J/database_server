require 'sinatra/base'

class DatabaseServer < Sinatra::Base

  get '/' do
    'Database Server'
  end
end
