class TrainingPlanTraining < ActiveRecord::Base
  belongs_to :training_plan
  belongs_to :training
end
