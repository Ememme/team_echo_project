class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reported_denounces, class_name: "Denounce", foreign_key: "author_user_id", dependent: :nullify
  has_many :received_denounces, class_name: "Denounce", foreign_key: "denounced_user_id", dependent: :nullify

  scope :with_nick_or_name, -> { where.not(nick: "").or(where.not(name: "")) }
  scope :without_me, ->(user) { where.not(id: user.id) }
end
