class UserMailer < ApplicationMailer
  def send_new_password(user, new_password)
    @user = user
    @new_password = new_password
    mail(to: @user.email, subject: 'Ваш новый пароль')
  end
end
