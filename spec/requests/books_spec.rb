require 'rails_helper'

RSpec.describe 'Book API', type: :request do
  # Init test data
  let!(:books) { create_list(:book, 10) }
  let(:book_id) { books.first.id }

  # Test for GET all books
  describe 'GET /books' do
    # Make an http request before the testing
    before { get '/books' }

    it "returns a list of books" do
      expect(json).not_to be_empty
      expect(json.size).to eql(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  # Test for GET single book
  describe 'GET /books/:id' do
    before { get "/books/#{book_id}" }

    context 'when the book exists' do
      it 'returns the book' do
      end

      it 'returns status code 200' do
      end
    end

    context 'when the record does not exist' do
      let(:book_id) { 100 }

      it 'returns status code 404' do
      end

      it 'returns a not found message' do
      end
    end
  end

  # Test for POST book (for creation)
  describe 'POST /books' do
    # valid payload
    let(:valid_attr) { {title: 'Art of War', author: 'Sun Tzu', 
                        section: "Games & Learning", batch: 1, size: 1} }
    # invalid
    let(:invalid_attr) { {title: 'asdfasdf', author: 'asd', section: "X", batch: 0} }

    context 'when the request is valid' do
      before { post '/books', params: valid_attr }

      it 'creates a book' do
        expect(json['title']).to eql('Art of War')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/books', params: invalid_attr }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation error message' do
        expect(response.body)
          .to match(/Validation failed: Size can't be blank/)
      end
    end
  end

  # Test for PUT /books/:id
  describe 'PUT /books/:id' do
    let(:valid_attr) { {title: 'War of Art'} }

    context 'when the record exists' do
      before { put "/books/#{book_id}", params: valid_attr }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test for DELETE /books/:id
  describe 'DELETE /books/:id' do
    before { delete "/books/#{book_id}" }

    it 'returns status code 204' do
        expect(response).to have_http_status(204)
    end
  end
end
