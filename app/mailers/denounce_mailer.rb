class DenounceMailer < ApplicationMailer
  default from: "mailerforncc@gmail.com"

    def denounce_email(user)
    @user = user
    mail(to: @user.email, subject: "You've been denounced")
  end
end
