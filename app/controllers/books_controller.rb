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
		@book =Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "You have updated book successfully."
			redirect_to book_path(@book)
		else
			render "books/edit"
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	def edit
		@book = Book.find(params[:id])
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end
end
