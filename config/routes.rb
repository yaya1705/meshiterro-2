Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  resources :post_images, only:[:index, :new, :create, :show, :destroy] do
  # resourceは「それ自身のidが分からなくても、関連する他のモデルのidから特定できる」といった場合に用いることが多い
    resource :favorites, only:[:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only:[:edit, :update, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
