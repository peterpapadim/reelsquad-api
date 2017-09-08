Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :lists
      resources :shows

      get "/users/:userID/lists", to: "users#lists"
      get "/users/:userID/lists/:listName/shows-users", to: "lists#shows_users"
      post "/users/:userID/lists/:listName/users/update", to: "lists#update_users"

      delete "/users/:userID/lists/:listName", to: "lists#destroy"
    end
  end
end
