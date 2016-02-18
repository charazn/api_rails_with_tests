class BooksController < ApplicationController
  def index
    @books = Book.all
    if rating = params[:rating]
      @books = Book.where(rating: rating)
    end
    render json: @books, status: 200
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: book, status: 201, location: books_url(book) # Rails know to create the url for this resource just created
                                                                # Incorrectly shown as book in video
    else
      render json: book.errors, status: 422
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy!
    render nothing: true, status: 204
  end

  private

  def book_params
    params.require(:book).permit(:title, :rating)
  end
end
