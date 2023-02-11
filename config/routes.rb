Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks, only: [:new, :create, :delete]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'lists', to: 'lists#index'
  get 'lists/new', to: 'lists#new', as: :list_new
  get 'lists/:id/bookmarks/new', to: 'bookmarks#new', as: :bookmark_new
  get 'lists/:id', to: 'lists#show', as: :list_detail
  post 'lists', to: 'lists#create'
  post 'lists/:id/bookmarks', to: 'bookmarks#create'
  delete 'bookmarks/:id', to: 'bookmarks#destroy', as: :bookmark
  delete 'lists/:id', to: 'lists#destroy', as: :list_delete
end
