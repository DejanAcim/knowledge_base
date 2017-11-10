class CreateTrainingPlanTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :training_plan_trainings do |t|
      t.integer :training_id, :training_plan_id
    end
  end
end
