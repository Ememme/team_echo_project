require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :reported_denounces }
  it { should have_many :received_denounces }
end
