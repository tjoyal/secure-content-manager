SecureContentManager::Application.routes.draw do

  devise_for :users

  resources :groups do
    resources :servers do
      resources :server_data_keys do
        member do
          get :private_key
        end
      end
    end
  end

  resource :home, :controller => :home

  root :to => 'home#show'

  match '*a', :to => 'errors#routing'
end
