Rails.application.routes.draw do
  post 'twilio/sms'
  devise_for :users
  root to: "posts#index"
  get 'posts/new', to: 'posts#new', as: 'posts'
  post 'posts/new', to: 'posts#create', as: "new"
  get 'posts/:id', to: 'posts#show', as: "show"
  get "posts/:id/edit", to: 'posts#edit', as: "edit"
  patch 'posts/:id/edit', to: 'posts#update'
  delete 'posts/:id', to: 'posts#destroy', as: "delete"
  get "/about", to: "posts#about", as: "about"
  # post "notifications/notify", to: "notifications#notify"
end
