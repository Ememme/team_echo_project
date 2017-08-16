class DenounceDecorator < ApplicationDecorator
  delegate_all

  def show_author
		if object.denounce_type_id == 3
			object.author_user.decorate.nick_or_name
		elsif object.denounce_type_id == 2
			object.author_user.decorate.nick_or_email
		else
			'@anonim'
		end
	end
end
