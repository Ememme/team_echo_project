class Denounce < ApplicationRecord
  validates :content, presence: true, length: { maximum: 150 }
  validates :denounce_type, presence: true
  validates :denounced_user, presence: true

  belongs_to :author_user, class_name: "User"
  belongs_to :denounced_user, class_name: "User"
  belongs_to :town
  belongs_to :denounce_type

  after_create :update_score

  private

  def update_score
    author_user.points += denounce_type.value
    author_user.save
  end
end
