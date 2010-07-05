ShoutyApp::Application.routes.draw do
  resources :shouties do
    collection do
      get :fetch
    end
  end
  root :to => 'shouties#index'
  devise_for :users
end
