class Denounce < ApplicationRecord

	belongs_to :author_user, class_name: "User"
	belongs_to :denounced_user, class_name: "User"
	belongs_to :town
	belongs_to :denounce_type

  after_create :update_score

  private

    def update_score(type_id)
      type = DenounceType.find(type_id)
      self.points += type.value
      self.save
    end
end
