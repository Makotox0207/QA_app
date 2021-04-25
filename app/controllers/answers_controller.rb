class AnswersController < ApplicationController
  def create
    answer =  Answer.new(answer_params)
    answer.user_id = current_user.id
    answer.question_id = params[:question_id]
    if answer.save
      redirect_to question_url(params[:question_id]), notice: '回答しました'
    else
      render "questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end
