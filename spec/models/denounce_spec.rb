require 'rails_helper'



RSpec.describe Denounce, type: :model do

  def setup
    user = User.create(name: 'a',
      nick: 'a',
      email: 'a@a.a',
      password: 'password',
      password_confirmation: 'password')
    town = Town.create :town
    type = DenounceType.create(name: 'a', value: 10)
  end

  

  it "orders by date_added" do
    a = Denounce.create!(content: 'a', author_user_id: 1, denounced_user_id: 1,
                        town_id: 1, denounce_type_id: 1, created_at: 2.hours.ago)
    b = Denounce.create!(content: 'a', author_user_id: 1, denounced_user_id: 1,
                        town_id: 1, denounce_type_id: 1, created_at: 1.hour.ago)
    c = Denounce.create!(content: 'a', author_user_id: 1, denounced_user_id: 1,
                        town_id: 1, denounce_type_id: 1, created_at: 3.hours.ago)
    expect(Denounce.all).to eq([b, a, c])
  end
end
