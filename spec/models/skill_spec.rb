require 'rails_helper'

RSpec.describe Skill, type: :model do

  describe 'validations' do

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(25) }
  end

  describe 'associations' do

    it { is_expected.to have_many(:training_plans).through(:training_plan_skills) }
  end

  describe 'db columns' do

    it { is_expected.to have_db_column(:id) }
    it { is_expected.to have_db_column(:name) }
  end
end
