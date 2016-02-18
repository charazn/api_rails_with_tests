Rails.application.routes.draw do
  resources :books, only: [:index, :create, :destroy]
  resources :finished_books, only: :index
end
