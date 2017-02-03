Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/backstage', as: 'rails_admin'
  root to: 'high_voltage/pages#show', id: 'home'
end
