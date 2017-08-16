class UserDecorator < ApplicationDecorator
  delegate_all

  def nick_or_name_or_email(options = {})
    return "@#{nick}" if nick.present?
    return name if name.present? && options[:skip_name] != true
    email
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
