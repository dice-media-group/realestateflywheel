Rails.application.routes.draw do
  resources :messages
  resources :message_scripts
  resources :contacts

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  mount RailsAdmin::Engine => '/backstage', as: 'rails_admin'

  root to: 'high_voltage/pages#show', id: 'home'
end
