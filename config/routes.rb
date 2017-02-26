Rails.application.routes.draw do

  resources :rosters, :roster_contacts
    
  get 'conversations/index'

  get 'conversations/new'

  get 'conversations/show'

  get 'conversations/create'

  get 'conversations/reply'

  get 'conversations/trash'

  get 'conversations/untrash'

  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  resources :broadcasts, only: [:index, :show, :new, :create]
  
    
  resources :messages, :message_scripts

  resources :contacts do
    resources :milestones, shallow: true
    resources :photos, shallow: true
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  mount RailsAdmin::Engine => '/backstage', as: 'rails_admin'

  root to: 'high_voltage/pages#show', id: 'home'
end
