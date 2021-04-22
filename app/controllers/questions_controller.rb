class QuestionsController < ApplicationController
  def index
    @questions= Question.all
  end

  def new
    @question= Question.new
  end

  def create
    question= Question.new(question_params)
    question.user_id = current_user.id
    if question.save
      redirect_to root_url, notice: '質問を投稿しました'
    else
      render :new
    end
  end

  def show
    @question= Question.find(params[:id])
  end

  def edit
    @question= Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update!(question_params)
    redirect_to question_url, notice: '質問を更新しました'
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to root_url, notice: '質問を削除しました'
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
