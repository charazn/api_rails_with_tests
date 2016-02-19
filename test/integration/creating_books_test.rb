require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest
  # When writing integration test, you want to be at the feature level rather than the implementation level,
  # you don't want to think about what controller is behind.
  # Eg. we are creating a book, but might not necessary refer to the books controller.
  test "create new books with valid data" do
    post '/books',
      { book: { title: 'Pragmatic Programmer',
                rating: 5,
                author: 'Dave Thomson',
                review: 'Excellent',
                genre_id: 1,
                amazon_id: '123123' } }.to_json,
      { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
      # 'Accept' is to tell the response format that we are sending back from our server to the client
      # 'Content-Type' is to tell our API the format of the data we are sending in
      # 'Content-Type' is both a request and response header, it always references the payload that we send to the client
      # In the case we are doing a post request, this refers to the conent-type of the post request
      # When we look at content-type as the response header, it refers to the format of the content-type of the response we get back from the server
    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    book = json(response.body)
    assert_equal books_url(book[:id]), response.location # Incorrectly shown as book_url in the video
    assert_equal 'Pragmatic Programmer', book[:title]
    assert_equal 5, book[:rating]
    assert_equal 'Dave Thomson', book[:author]
    assert_equal 'Excellent', book[:review]
    assert_equal 1, book[:genre_id]
    assert_equal '123123', book[:amazon_id]
  end

  test "create new books with invalid data" do # if want to test validations, should use model test
    post '/books',
      { book: { title: nil, rating: 5 } }.to_json,
      { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    assert_equal 422, response.status
  end
end
