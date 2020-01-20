Rails.application.routes.draw do
  resources :dashboards
  root to: 'dashboards#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
