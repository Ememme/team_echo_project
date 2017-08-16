require 'rails_helper'

RSpec.describe Denounce, type: :model do
  it { should belong_to :author_user }
  it { should belong_to :denounced_user }
  it { should belong_to :town }
  it { should belong_to :denounce_type }
end
