Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }

  resources :users, only: [:show, :index] do
    # resources :projects, only: [:index, :new, :create,:show]
  end

  resources :projects do
    resources :tasks, only: [:show, :new, :create, :edit, :update, :destroy]
    get 'calendar', to: 'projects#calendar', as: :calendar, on: :member
  end

  resources :tasks, only: [:show, :edit, :update, :destroy]

  resources :trophies, only: [:show, :update, :index]

  root to: "pages#home"
end
