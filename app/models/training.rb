class Training < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  has_many :training_plan_trainings
  has_many :trainings, through: :training_plan_trainings
end
