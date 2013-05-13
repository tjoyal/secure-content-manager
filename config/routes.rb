SecureContentManager::Application.routes.draw do

  devise_for :users

  resources :groups

  root :to => 'welcome#show'

  match '*a', :to => 'errors#routing'
end
