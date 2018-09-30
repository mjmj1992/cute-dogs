Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }

  post 'vote', to: 'home#vote'

  get 'doggos/index', to: 'doggos#index'

  root 'home#index'
end
