require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web => "/sidekiq"

  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#index"

  resources :rooms do
    resources :messages
  end

  get "user/:id/chat" => "users#chat", as: :user_chat

end
