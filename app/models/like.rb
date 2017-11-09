class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :training_plan

  validates_uniqueness_of :user, scope: :training_plan
end
