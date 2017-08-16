class UserDecorator < ApplicationDecorator
  delegate_all

  def nick_or_name_or_email(options = {})
    return "@#{nick}" if nick.present?
    return name if name.present? && options[:skip_name] != true
    email
  end
end
