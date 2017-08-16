class UserDecorator < ApplicationDecorator
  delegate_all

  def nick_or_name
    return name unless name.blank?
    nick_or_email
  end
  def nick_or_email
    return "@#{nick}" unless nick.blank?
    return email
  end

  def author_slack_name(denounce_id)
   denounce_type_name = fetch_reported_denounce(denounce_id).denounce_type.name
   return "Anon" if denounce_type_name == 'Anonim'
   return "#{object.nick}" if denounce_type_name == 'Pokaż pseudonim'
   return "#{object.name}" if denounce_type_name == 'Pokaż nazwisko'
  end

  private

  def fetch_reported_denounce(denounce_id)
    object.reported_denounces.find(denounce_id)
  end
end
