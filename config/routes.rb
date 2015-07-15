Rails.application.routes.draw do
  get 'courses', to: 'courses#index'

  root to: 'visitors#index'
  namespace :api, defaults: { format: :json } do
    resources :courses
  end

end
