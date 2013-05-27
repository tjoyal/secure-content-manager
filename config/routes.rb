SecureContentManager::Application.routes.draw do

  devise_for :users, :controllers => { :sessions => "sessions" }

  resources :groups do
    resources :servers do
      resources :server_data_keys do
        member do
          get :private_key
          get :public_key
        end
      end
      resources :server_data_notes
    end
  end

  resource :home, :controller => :home

  root :to => 'home#show'

  match '*a', :to => 'errors#routing'
end
