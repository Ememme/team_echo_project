# Preview all emails at http://localhost:3000/rails/mailers/denounce_mailer
class DenounceMailerPreview < ActionMailer::Preview
  def denounce_mail_preview
    DenounceMailer.denounce_email(User.first)
  end
end
