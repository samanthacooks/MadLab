Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :proposals

  resources :experiments do
    resources :procedures
    resources :comments,except:[:create]
    resources :observations
  end
    post '/experiments/:experiment_id/comments' => 'comments#create', as: 'experiments_comment_post'

  get '/about' => "welcome#about"
  get '/help' => "welcome#help"


  root "welcome#index"
end
