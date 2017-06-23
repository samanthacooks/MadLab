Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :proposals
  resources :experiments do
    resources :procedures
    resources :comments,except:[:create,:destroy]
    resources :observations,except:[:destroy]
  end
    post '/experiments/:experiment_id/comments' => 'comments#create', as: 'experiments_comment_post'
    delete '/experiments/:experiment_id/comments/:id' => 'comments#destroy', as: 'experiments_comment_post_destroy'
    delete '/experiments/:experiment_id/observations/:id' => 'observations#destroy', as: 'destroy_exp_observation_destroy'
    get '/about' => "welcome#about"
    get '/help' => "welcome#help"
    root "welcome#index"
end
