class TrainingPlansController < ApplicationController

  def index
    @training_plans = TrainingPlan.all
  end
end
