Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }
  resources :users, only: [:show, :index] do
    resources :projects, only: [:index, :new, :create,:show]

    resources :projects, only: [] do
      resources :tasks, only: [:index, :new, :create]
    end

    resources :achievements, only: [:index, :new, :create]

    resources :trophies, only: [:index, :new, :create]
  end

  resources :projects do
    resources :tasks, only: [:show, :new, :create, :edit, :update, :destroy]

  end

  resources :tasks, only: [:show, :edit, :update, :destroy]

  resources :achievements, only: [:index, :show ]

  resources :trophies, only: [:show, :update]

  root to: "pages#home"
end
