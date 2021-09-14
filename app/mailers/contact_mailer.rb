class ContactMailer < ApplicationMailer
  def contact_mail(post)
    @post = post
    mail to: @post.user.email, subject: "Email de confirmation du post"
  end
end
