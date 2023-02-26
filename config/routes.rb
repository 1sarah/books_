Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#index'

  resources :book_reading_wishlists, only: [:index, :update] do
    resources :books, only: [:create, :destroy], controller: 'book_reading_wishlist_books'
  end
end
