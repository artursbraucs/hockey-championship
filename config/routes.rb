Rails.application.routes.draw do
  resources :teams
  resources :players do
    collection do
      get 'remote_players'
    end
  end
  resources :scores

  root 'scores#index'
end
