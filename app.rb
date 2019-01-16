require 'sinatra'
configure { set :server, :puma }

get '/' do
  {:hi => 'dad'}.to_json
end