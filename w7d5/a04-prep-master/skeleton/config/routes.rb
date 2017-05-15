Links::Application.routes.draw do
  resources :users
  resource :session
  resources :links
end
