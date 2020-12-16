Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :contacts, only: :create
    end
  end

  get '/_health' => 'application#health_check'
end
