require 'sinatra'

get '/' do
  {:hi => 'mom'}.to_json
end