class UserDecorator < ApplicationDecorator
  delegate_all

  def nick_or_name
    return name unless name.blank?
    nick_or_email
  end
  def nick_or_email
    return "@#{nick}" unless nick.blank?
    return email
  end

end
