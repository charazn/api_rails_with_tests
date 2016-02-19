require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  setup do
    @fiction = Genre.create!(name: "Fiction")
    @fiction.books.create!(title: "Star Trek", rating: 5)
    @fiction.books.create!(title: "Hunger Game", rating: 1)
  end

  test "listing books" do
    get "/books"

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    books = json(response.body)[:books] # Returns an array of books (each a Hash of book information)
    assert_equal Book.count, books.size
    book = Book.find(books.first[:id])
    assert_equal @fiction.id, book.genre.id
  end

  test "list top rated books" do
    get "/books?rating=5"

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal 1, json(response.body)[:books].size
  end
end
