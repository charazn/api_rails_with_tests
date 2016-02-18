Rails.application.routes.draw do
  resources :books, only: [:index, :create]
  resources :finished_books, only: :index
end
