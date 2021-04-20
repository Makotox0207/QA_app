class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def index
    @users=User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "登録に成功しました"
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(user_params)
  end

  def show
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :email, :password, :password_confirmation)
  end

end
