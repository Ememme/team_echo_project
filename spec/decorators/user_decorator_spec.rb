require 'rails_helper'

RSpec.describe UserDecorator do
  let(:user) { build(:user, nick: nick, name: name) }
  let(:nick) { nil }
  let(:name) { nil }

  describe '#nick_or_name_or_email' do
    context 'with default parameters' do
      subject { user.decorate.nick_or_name_or_email }

      context 'when user has nick' do
        let(:nick) { "nick" }

        it 'should return nick with @ sign prefixed' do
          expect(subject).to eq('@nick')
        end
      end

      context 'when user does not have a nick' do
        context 'and user has name' do
          let(:name) { "name" }

          it 'should return name' do
            expect(subject).to eq('name')
          end
        end

        context 'and user does not have a name' do
          it 'should return email' do
            expect(subject).to eq(user.email)
          end
        end
      end
    end

    context 'with skip_name param set to true' do
      subject { user.decorate.nick_or_name_or_email(skip_name: true) }

      context 'when user has nick' do
        let(:nick) { "nick" }

        it 'should return nick with @ sign prefixed' do
          expect(subject).to eq('@nick')
        end
      end

      context 'when user does not have a nick' do
        context 'and user has name' do
          let(:name) { "name" }

          it 'should return email' do
            expect(subject).to eq(user.email)
          end
        end

        context 'and user does not have a name' do
          it 'should return email' do
            expect(subject).to eq(user.email)
          end
        end
      end
    end
  end
end
