class QuestionsController < ApplicationController

  def index
    @q = Question.ransack(params[:q])
    @questions= @q.result.page(params[:page]).per(4)
  end

  def unsolved
    @q = Question.ransack(params[:q])
    @questions = @q.result.where(status: 'unsolved').page(params[:page]).per(4)
  end
  
  def solved 
    @q = Question.ransack(params[:q])
    @questions = @q.result.where(status: 'solved').page(params[:page]).per(4)
  end
  
  def new
    @question= current_user.questions.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to questions_url, notice:'質問を投稿しました'
    else
      render :new
    end
  end

  def show
    @question= Question.find(params[:id])
    @answer = Answer.new
    @answers = Answer.all
  end

  def edit
    @question= Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update!(question_params)
      redirect_to question_url, notice: '質問を更新しました'
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy!
    redirect_to root_url, notice: '質問を削除しました'
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :status)
  end
end
