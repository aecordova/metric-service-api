Rails.application.routes.draw do
  root to: 'docs#index'
  
  namespace :api do
    namespace :v1 do
      post 'metric/:key', to: 'metrics#create'
      delete 'metric/:key', to: 'metrics#destroy'
      get 'metrics', to: 'metrics#index'
    end
  end
end
