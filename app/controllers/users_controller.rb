class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :ensure_correct_user,{only:[:edit, :update]}

	def index
		@users =User.page(params[:page]).reverse_order
		@new_book = Book.new
	end

 	def show
  		@user = User.find(params[:id])
  		@books = @user.books.page(params[:page]).reverse_order
  		@new_book = Book.new
 	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if  @user.update(user_params)
			flash[:notice] = "You have updated user successfully"
			redirect_to user_path(@user)
		else
			render "users/edit"
		end
	end

	def ensure_correct_user
		@user = User.find(params[:id])
		if @user.id != current_user.id
			redirect_to users_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:name,:profile_image, :introduction)
	end

end
