class UserMailer < ApplicationMailer
  def send_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Test Email for Letter Opener')
  end
end
