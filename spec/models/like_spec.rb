require 'rails_helper'

RSpec.describe Like, type: :model do
  # I need to investigate this test a bit more
  # https://stackoverflow.com/questions/41275498/how-to-use-shoulda-matcher-to-test-uniqueness-of-one-foreign-key-scoped-to-the-o

  # describe 'validations' do
  #
  #   it { should validate_uniqueness_of(:user).scoped_to(:training_plan) }
  # end

  describe 'associations' do

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:training_plan) }
  end

  describe 'db columns' do

    it { is_expected.to have_db_column(:id) }
    it { is_expected.to have_db_column(:like) }
    it { is_expected.to have_db_column(:training_plan_id) }
    it { is_expected.to have_db_column(:user_id) }
    it { is_expected.to have_db_column(:created_at) }
    it { is_expected.to have_db_column(:updated_at) }
  end
end
