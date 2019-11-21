class BooksController < ApplicationController
	before_action :authenticate_user!, only: [:create, :index, :show, :update, :destroy, :edit]

	def top
	end

	def about
	end

	def create
		@book = Book.new(book_params)
		@book.user = current_user
		if @book.save
			flash[:notice] = "You have created book successfully."
			redirect_to book_path(@book)
		else
			@books = Book.all
			@new_book = Book.new
			render "books/index"
		end
	end

	def index
		@books = Book.all
		@new_book = Book.new
	end

	def show
		@book =Book.find(params[:id])
		@new_book = Book.new
		@user = @book.user
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
