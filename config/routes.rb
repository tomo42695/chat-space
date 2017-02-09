Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, except: [:destroy, :show], shallow: true do
    resources :messages, only: [:new, :create]
    collection do
      get 'search'
    end
  end
end
