class Training < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  has_many :training_plan_trainings
  has_many :training_plans, through: :training_plan_trainings
end
