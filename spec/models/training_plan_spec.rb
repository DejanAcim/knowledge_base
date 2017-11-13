require 'rails_helper'

RSpec.describe TrainingPlan, type: :model do

  describe 'validations' do

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(100) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_least(20).is_at_most(500) }
    it { is_expected.to validate_presence_of(:user_id) }
  end

  describe 'associations' do

    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:skills).through(:training_plan_skills) }
    it { is_expected.to have_many(:trainings).through(:training_plan_trainings) }
  end

  describe 'db columns' do

    it { is_expected.to have_db_column(:id) }
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:description) }
    it { is_expected.to have_db_column(:user_id) }
    it { is_expected.to have_db_column(:created_at) }
    it { is_expected.to have_db_column(:updated_at) }
  end
end
