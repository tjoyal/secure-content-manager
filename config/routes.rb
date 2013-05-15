SecureContentManager::Application.routes.draw do

  devise_for :users

  resources :groups do
    resources :server
  end

  resources :servers

  root :to => 'home#show'

  match '*a', :to => 'errors#routing'
end
