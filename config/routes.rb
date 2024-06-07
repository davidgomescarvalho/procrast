Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index] do
    resources :projects, only: [:index, :new, :create]

    resources :projects, only: [] do
      resources :tasks, only: [:index, :new, :create]
    end

    resources :achievements, only: [:index, :new, :create]

    resources :trophies, only: [:index, :new, :create]
  end

  resources :projects, only: [:show, :edit, :update, :destroy] do

    resources :tasks, only: [:show, :edit, :update, :destroy]
  end

  resources :tasks, only: [:show, :edit, :update, :destroy]

  resources :achievements, only: [:show, :edit, :update, :destroy]

  resources :trophies, only: [:show, :edit, :update, :destroy]

  root to: "pages#home"

end
