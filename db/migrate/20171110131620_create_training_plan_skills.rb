class CreateTrainingPlanSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :training_plan_skills do |t|
      t.integer :skill_id, :training_plan_id
    end
  end
end
