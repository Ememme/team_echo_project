class DenounceMailer < ApplicationMailer
  default from: "mailerforncc@gmail.com"

    def denounce_email(user)
    @user = user
    mail(to: @user.email, subject: t(email_topic))
  end
end
