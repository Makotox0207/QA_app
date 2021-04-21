class QuestionsController < ApplicationController
  def index
    @questions= Question.all
  end

  def new
    @question= Question.new
  end

  def create
    @question= Question.new(question_params)
      if @question.save
        redirect_to root_url, notice: '質問を投稿しました'
      else
        render :new
      end
  end

  def show
    @question= Question.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
