class Town < ApplicationRecord
  has_many :denounces, dependent: :destroy

  def self.first_or_one
    if table_exists? && first.present?
      first.id
    else
      1
    end
  end
end
