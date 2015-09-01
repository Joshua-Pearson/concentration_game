Rails.application.routes.draw do

  resources :games, only: [:create, :show]
  post "games/turn"
  resources :players, only: [:create]
  root "games#welcome"

end
