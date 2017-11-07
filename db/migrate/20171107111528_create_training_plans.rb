class CreateTrainingPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :training_plans do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
