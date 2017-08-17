class DenounceType < ApplicationRecord
  has_many :denounces, dependent: :destroy

  def name
    I18n.t("denounce_types.gid_#{gid}")
  end
end
