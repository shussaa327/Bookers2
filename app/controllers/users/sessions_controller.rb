class Users::SessionsController < Divise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: "ゲストとしてログインしました"
  end
end