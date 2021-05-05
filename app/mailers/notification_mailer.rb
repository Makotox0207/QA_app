class NotificationMailer < ApplicationMailer
  default from: 'notification@example.com'
  def question_notification_to_all(question)
    @question = question
    @user = @question.user
    email = User.where.not(id: @user.id).pluck(:email)
    mail(subject: "質問が追加されました", to: email)
  end
end
