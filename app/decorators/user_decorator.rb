class UserDecorator < ApplicationDecorator
  delegate_all

  def nick_or_name_or_email
    nick_or_name || email
  end

  def nick_or_name_or_anon
    nick_or_name || I18n.t('anon')
  end

  def nick_or_name
    return "@#{nick}" if nick.present?
    return name if name.present?
  end

  def author_slack_name(denounce_id)
    denounce_type_gid = fetch_reported_denounce(denounce_id).denounce_type.gid

    return object.name || I18n.t('anon') if denounce_type_gid == 3
    return object.nick || I18n.t('anon') if denounce_type_gid == 2
    I18n.t('anon')
  end

  def allowed_denounce_types
    allowed_denounce_types = []
    allowed_denounce_types << DenounceType.find_by(gid: 1)
    allowed_denounce_types << DenounceType.find_by(gid: 2) if object.nick.present?
    allowed_denounce_types << DenounceType.find_by(gid: 3) if object.name.present?
    allowed_denounce_types
  end

  private

  def fetch_reported_denounce(denounce_id)
    object.reported_denounces.find(denounce_id)
  end
end
