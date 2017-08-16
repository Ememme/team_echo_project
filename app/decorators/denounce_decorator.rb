class DenounceDecorator < ApplicationDecorator
  delegate_all

  def show_author
		if object.denounce_type_id == 3
			object.author_user.name
		elsif object.denounce_type_id == 2
			"@#{object.author_user.nick}"
		else
			'@anonim'
		end
  end
end
