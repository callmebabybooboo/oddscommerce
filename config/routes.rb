Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  namespace :admin do
    # Admin routes here
  end
end
