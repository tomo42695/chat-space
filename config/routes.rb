Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, only: [:index, :new, :edit, :create, :update], shallow: true do
    resources :messages, only: [:new, :create]
  end
end
