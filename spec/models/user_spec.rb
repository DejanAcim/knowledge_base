require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Dejan',
                           surname: 'Acimovic',
                           email: 'dejan@example.com',
                           password: 'password') }

  describe 'validations' do

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:surname) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(8).is_at_most(255) }
    it { is_expected.to validate_presence_of(:email) }
    it 'validate uniqueness of email' do
      is_expected.to validate_uniqueness_of(:email).case_insensitive
    end
    it 'should accept valid addresses' do
      valid_addresses = %w[user@eee.com R_TTD-DE@eee.hello.org user@example.com first.last@gmail.com laura+joe@mon.eu]
      valid_addresses.each do |email|
        user.email = email
        is_expected.to allow_value(email).for(:email)
      end
    end
    it 'should reject invalid addresses' do
      invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
      invalid_addresses.each do |email|
        user.email = email
        is_expected.to_not allow_value(email).for(:email)
      end
    end
  end

  describe 'associations' do

    it { is_expected.to have_many(:training_plans) }
    it { is_expected.to have_many(:likes) }
  end

  describe 'callbacks' do

    context 'before_save' do
      it ':format_input' do
        test_name = 'dejan'
        test_surname = 'acimovic'
        test_email = 'DejAn2@ExaMple.CoM'
        user = User.create(name: test_name,
                           surname: test_surname,
                           email: test_email,
                           password: 'password')
        expect(user.reload.email).to eq(test_email.downcase)
        expect(user.reload.name).to eq(test_name.titleize)
        expect(user.reload.surname).to eq(test_surname.titleize)
      end
    end
  end

  describe 'db columns' do

    it { is_expected.to have_db_column(:id) }
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:surname) }
    it { is_expected.to have_db_column(:email) }
    it { is_expected.to have_db_column(:password_digest) }
    it { is_expected.to have_db_column(:admin) }
    it { is_expected.to have_db_column(:created_at) }
    it { is_expected.to have_db_column(:updated_at) }
  end
end
