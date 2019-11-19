class BooksController < ApplicationController
	def top
	end
	def about
	end
	def new
		@book = Book.new
	end
	def create
		@book = Book.new(book_params)
		@book.user = current_user
		if @book.save
			redirect_to book_path(@book)
		else
			render "books/new"
		end
	end
	def index
		@books = Book.all
	end
	def show
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end
end
