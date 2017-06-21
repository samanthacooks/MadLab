Rails.application.routes.draw do
  devise_for :users

  resources :experiments do
    resources :proposals,except: [:index]
    resources :comments
    resources :observations
  end

  root "welcome#index"
end
