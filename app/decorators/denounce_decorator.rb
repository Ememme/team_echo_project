class DenounceDecorator < ApplicationDecorator
  delegate_all

  def show_author
    author_name_or_nick || I18n.t('anon')
  end

  private

  def author_name_or_nick
    if object.denounce_type.gid == 3
      object.author_user.name
    elsif object.denounce_type.gid == 2
      object.author_user.nick
    end
  end
end
