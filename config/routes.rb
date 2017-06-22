Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :proposals

  resources :experiments do
    resources :comments
    resources :observations
  end

  root "welcome#index"
end
