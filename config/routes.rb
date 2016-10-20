Rails.application.routes.draw do


  resources :reservations

  resources :listings #7 restful routes auto listed


  get 'home/index'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  
   resources :users, only: [:show, :edit, :update, :destroy] 

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  #Delete profile image
  delete "/users/:id/image" => "users#delete_image", as: "remove_image"



  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :listings, only: [:index]
end
