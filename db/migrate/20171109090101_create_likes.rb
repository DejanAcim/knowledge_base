class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :user_id, :training_plan_id
      t.timestamps
    end
  end
end
