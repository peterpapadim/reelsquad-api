Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :lists
      resources :shows

      get "/users/:userID/lists", to: "users#lists"
      get "/users/:userID/lists/:listName/shows", to: "users#shows"

      delete "/users/:userID/lists/:listName", to: "lists#destroy"
    end
  end
end
