require "sinatra"
require "sinatra/cross_origin"
require "json"
configure { set :server, :puma }

# Enable cross-origin requests
configure do
  enable :cross_origin
end

before do
  # Encode all responses as "application/json"
  content_type :json
  # Allow requests from any origin
  response.headers["Access-Control-Allow-Origin"] = "*"
end

get "/api/v1/cards" do
  File.read("cards.json")
end

get "/api/v1/cards/:card_id" do
  cards = JSON.parse(File.read("cards.json"))

  cards.filter! { |card| card["id"] == params[:card_id] }

  cards.to_json
end

# Set options for cross-origin requests
options "*" do
  response.headers["Allow"] = "GET, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "*"
  200
end
