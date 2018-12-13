Rails.application.routes.draw do
  root 'root#index'

  resources :users, only: [:new, :create, :show]

end
