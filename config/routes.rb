Rails.application.routes.draw do
  config = Rails.application.config.petri

  constraints host: config[:user][:host] do
    namespace :user, path: config[:user][:path] do
      root 'top#index'
      resources :posts, only: [ :index, :new, :create ]
    end
  end
end
