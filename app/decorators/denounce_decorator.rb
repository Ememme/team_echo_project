class DenounceDecorator < ApplicationDecorator
  delegate_all

  def show_author
    if object.denounce_type_id == 3
      object.author_user.decorate.nick_or_name_or_email
    elsif object.denounce_type_id == 2
      object.author_user.decorate.nick_or_name_or_email(skip_name: true)
    else
      '@anonim'
    end
  end
end
