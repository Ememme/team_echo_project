class Denounce < ApplicationRecord

	belongs_to :author_user, class_name: "User"
	belongs_to :denounced_user, class_name: "User"
	belongs_to :town
	belongs_to :denounce_type
  default_scope -> { order(created_at: :desc) }


end
