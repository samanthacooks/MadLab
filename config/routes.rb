Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :proposals do
    resources :experiments
    resources :comments
    resources :observations
  end

  get '/proposals' => "proposals#index"
  root "welcome#index"
end
