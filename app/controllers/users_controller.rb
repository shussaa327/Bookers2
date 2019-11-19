class UsersController < ApplicationController
	def info
		@user = User.find(params[:id])
	end

	def index
		@users =User.all
	end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books.page(params[:page]).reverse_order
  end

def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
	if @user.update(user_params)
		flash[:notice] = "You have updated user successfully"
		redirect_to user_path(@user)
	else
		render "users/edit"
	end
end

private

	def user_params
		params.require(:user).permit(:name, :user_introduction)
	end

end
