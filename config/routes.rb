Rails.application.routes.draw do
  get 'genres/index'

  resources :books, only: [:index, :create, :show, :destroy]
  resources :finished_books, only: :index
  resources :genres, only: :index
end
