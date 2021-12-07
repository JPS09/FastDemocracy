Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :polls, only: %i[new show create update]
  resources :questions, only: %i[new show create update]

  patch '/polls/:poll_id/questions_done', to: 'polls#questions_done', as: 'questions_done'
  post '/polls/:poll_id/add_voters', to: 'voters#create', as: 'add_voters'
  resources :contacts, only: %i[new index show create update]
  resources :answers, only: %i[new show update create destroy]

  get '/polls/:poll_id/vote/:token', to: 'opinions#new'
  post '/polls/:poll_id/vote/:token', to: 'opinions#create'

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
