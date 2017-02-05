Rails.application.routes.draw do
  resources :contacts
  devise_for :users
  mount RailsAdmin::Engine => '/backstage', as: 'rails_admin'
  root to: 'high_voltage/pages#show', id: 'home'
end
