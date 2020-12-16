Rails.application.routes.draw do
  devise_for :users

  get '/_health' => 'application#health_check'

  namespace :api do
    namespace :v1 do
      resources :contacts, only: :create
    end
  end

  root 'home#show'

  resource :home, only: :show, controller: :home
end
