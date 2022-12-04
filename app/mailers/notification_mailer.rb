class NotificationMailer < ApplicationMailer
  default from: 'notification@example.com'

  def question_notification_to_all(question)
    @question = question
    @user = @question.user
    email = User.where.not(id: @user.id).pluck(:email)
    mail(subject: "質問が追加されました", to: email)
  end

  def answer_notification_to_users(answer)
    @answer = answer
    @user = @answer.user
    @question = @answer.question
    # 自分を除く質問に答えたユーザー全員にメールを送信
    answers = Answer.where(question_id: @question.id)
    user_ids = answers.pluck(:user_id)
    users = User.where(id: user_ids)
    email = users.where.not(id: @answer.user_id).pluck(:email)
    mail(subject: "「#{@question.title}」に回答が追加されました", to: email)
  end

  def question_notification_to_user(answer)
    @answer = answer
    @user = @answer.user
    @question = @answer.question
    # 質問に回答がきた場合その質問者に対してメールを送信
    mail(subject: "「#{@question.title}」に回答が追加されました", to: @question.user.email)
    
  end
end
