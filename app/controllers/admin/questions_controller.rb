class Admin::QuestionsController < ApplicationController
  def index
    @q = Question.ransack(params[:q])
    @questions= @q.result.page(params[:page]).per(4)
    unless current_user.admin?
      redirect_to root_url
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy!
    redirect_to admin_users_url, notice: '質問を削除しました'
  end
end
