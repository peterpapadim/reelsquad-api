Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :lists
      resources :shows

      get "/users/:userID/lists", to: "users#lists"
    end
  end
end
