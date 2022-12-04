class Admin::UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users= @q.result.page(params[:page]).per(4)
    unless current_user.admin?
      redirect_to root_url
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
    redirect_to admin_users_url, notice: 'ユーザーを削除しました'
  end
end
