Rails.application.routes.draw do
  config = Rails.application.config.petri

  constraints host: config[:user][:host] do
    namespace :user, path: config[:user][:path] do
      root 'top#index'
      resources :posts, only: [ :index, :new, :create, :show ] do
        resources :answer, only: [ :create, :edit, :update]
      end
    end
  end
end
