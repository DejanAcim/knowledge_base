class TrainingPlan < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :training_plan_skills, dependent: :destroy
  has_many :skills, through: :training_plan_skills
  has_many :training_plan_trainings, dependent: :destroy
  has_many :trainings, through: :training_plan_trainings

  validates :name, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 20, maximum: 500 }
  validates :user_id, presence: true

  default_scope -> { order(updated_at: :desc) }

  def thumbs_up_total
    self.likes.where(like: true).size
  end

  def thumbs_down_total
    self.likes.where(like: false).size
  end
end
