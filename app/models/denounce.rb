class Denounce < ApplicationRecord

	belongs_to :author_user, class_name: "User", primary_key: "author_user_id"
	belongs_to :denounced_user, class_name: "User", primary_key: "denounced_user_id"

end
