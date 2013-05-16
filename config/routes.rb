SecureContentManager::Application.routes.draw do

  devise_for :users

  resources :groups do
    resources :servers
  end

  root :to => 'home#show'

  match '*a', :to => 'errors#routing'
end
