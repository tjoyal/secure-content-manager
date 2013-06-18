SecureContentManager::Application.routes.draw do

  devise_for :users, :controllers => { :sessions => "sessions" }

  resources :groups do
    resources :servers do
      resources :server_data_keys do
        member do
          get :private_key
        end
      end
      resources :server_data_notes
      resources :server_data_passwords do
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
