class UserDecorator < ApplicationDecorator
  delegate_all

  def nick_or_name
    return name unless name.blank?
    return nick unless nick.blank?
    return email
  end

end
