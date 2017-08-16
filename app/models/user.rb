class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reported_denounces, class_name: "Denounce", foreign_key: "author_user_id"
  has_many :received_denounces, class_name: "Denounce", foreign_key: "denounced_user_id"

  def update_score(typeid)
    type = DenounceType.find(typeid)
    self.points += type.value
    self.save
  end
end
