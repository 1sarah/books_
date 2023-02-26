class Book < ApplicationRecord
    belongs_to :book_reading_wishlist, optional: true
  
    validates :title, presence: true
    validates :author, presence: true
  
    def self.search(query)
      response = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{query}&key=#{ENV['GOOGLE_BOOKS_API_KEY']}")
      data = JSON.parse(response.body)
      data['items'].map do |item|
        book = Book.new
        book.title = item['volumeInfo']['title']
        book.author = item['volumeInfo']['authors'].try(:join, ', ')
        book.description = item['volumeInfo']['description']
        book.thumbnail_url = item['volumeInfo']['imageLinks']['thumbnail']
        book
      end
    end
  end
  