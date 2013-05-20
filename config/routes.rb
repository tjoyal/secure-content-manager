SecureContentManager::Application.routes.draw do

  devise_for :users

  resources :groups do
    resources :servers
  end

  resource :home, :controller => :home

  root :to => 'home#show'

  match '*a', :to => 'errors#routing'
end
