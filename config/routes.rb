SecureContentManager::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, :controllers => { :sessions => "sessions" }

  resources :groups do
    resources :servers do
      resources :keys, :controller => 'server_data/keys' do
        member do
          get :private_key
        end
      end
      #resources :notes, :controller => 'server_data/notes'
      resources :passwords, :controller => 'server_data/passwords' do
        member do
          get :password
        end
      end
    end
  end

  namespace :setting do
    resources :groups
  end

  resource :home, :controller => :home do
    get :profile
  end

  root :to => 'home#show'

  match '*a', :to => 'errors#routing'
end
