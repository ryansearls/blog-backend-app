Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/users" => "api/users#create"
  post "/sessions" => "api/sessions#create"

  get "/posts" => "api/posts#index"
  post "/posts" => "api/posts#create"
  get "/posts/:id" => "api/posts#show"
  patch "/posts/:id" => "api/posts#update"
  delete "/posts/:id" => "api/posts#destroy"
end
