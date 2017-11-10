class Skill < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 25 }
  has_many :training_plan_skills
  has_many :training_plans, through: :training_plan_skills
end
