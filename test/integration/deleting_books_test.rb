require 'test_helper'

class DeletingBooksTest < ActionDispatch::IntegrationTest
  setup do
    @book = Book.create!(title: "Pragmatic Programmer")
  end

  test "delete book" do
    delete "/books/#{@book.id}"

    assert_equal 204, response.status # 204 No Content. The server has fulfilled the request but does not need to return an entity-body, and might want to return updated metainformation.
  end
end
