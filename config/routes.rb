Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  resources :post_images, only:[:index, :new, :create, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only:[:edit, :update, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
