Rails.application.routes.draw do
  post 'metrics/:key', to: 'metrics#create'
  delete 'metrics/:key', to: 'metrics#destroy'
  get 'metrics', to: 'metrics#index'
end
