class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  use Rack::JSONBodyParser

  get '/games' do
    games = Game.all.order(:title).limit(10)
    games.to_json
  end



  delete '/games/:id' do
    game = Game.find(params[:id])
    game.destroy
    game.to_json
  end 


  post '/reviews' do
    review = Review.create(
      score: params[:score],
      comment: params[:comment],
      game_id: params[:game_id],
      user_id: params[:user_id]
    )
    review.to_json
  end 


end
