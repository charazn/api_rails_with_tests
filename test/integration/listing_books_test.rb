require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  setup do
    Book.create!(title: "Pragmatic Programmer", rating: 5)
    Book.create!(title: "Hunger Game", rating: 1)
  end

  test "listing books" do
    get '/books'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
