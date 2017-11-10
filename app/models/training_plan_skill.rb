class TrainingPlanSkill < ActiveRecord::Base
  belongs_to :training_plan
  belongs_to :skill
end
