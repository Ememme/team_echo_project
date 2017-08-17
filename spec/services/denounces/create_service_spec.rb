require 'rails_helper'

describe Denounces::CreateService do
  describe '#call' do
    let(:author) { create(:user) }
    let(:town) { create(:town) }
    let(:denounced_user) { create(:user) }
    let(:denounce_type) { create(:denounce_type) }

    subject { described_class.new(params, author, town).call }

      it 'creates new denounce' do
        expect { subject }.to change { Denounce.count }.by(1)
        expect(Denounce.last.author_user).to eq author
      end
    end

    context "when params are invalid" do
      let(:params) { {} }

      it 'does not create new denounce' do
        expect { subject }.not_to change { Denounce.count }
      end
    end
  end
end