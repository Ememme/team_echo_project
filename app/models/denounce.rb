class Denounce < ApplicationRecord

	belongs_to :author_user, class_name: "User"
	belongs_to :denounced_user, class_name: "User"
	belongs_to :town
	belongs_to :denounce_type
  default_scope -> { order(created_at: :desc) }

	def show_author
		if self.denounce_type_id == 3
			self.author_user.name
		elsif self.denounce_type_id == 2
			'@' + self.author_user.nick
		else
			'@anonim'
		end
	end
end
