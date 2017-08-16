require 'rails_helper'

RSpec.describe DenounceType, type: :model do
  it { should have_many :denounces }
end
