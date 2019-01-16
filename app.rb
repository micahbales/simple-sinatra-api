require 'sinatra'
require 'json'
configure { set :server, :puma }

# Encode all responses as 'application/json'
before do
  content_type :json
end

get '/api/v1/cards' do
  File.read('cards.json')
end

get '/api/v1/cards/:card_id' do
  cards = JSON.parse(File.read('cards.json'))

  cards.filter! { |card| card["id"] == params[:card_id] }

  cards.to_json
end