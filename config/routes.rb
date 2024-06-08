Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :projects do
    resources :tasks
  end

  resources :achievements, only: [:index, :show ]

  resources :trophies, only: [:show, :update]

  root to: "pages#home"
end
