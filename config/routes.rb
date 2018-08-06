Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  resources :histories
  get 'histories/user', as: 'user_histories'
  get 'admins/panel', as: 'panel_admins'
  resources :admins, only: [:edit, :update]
  root 'histories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
