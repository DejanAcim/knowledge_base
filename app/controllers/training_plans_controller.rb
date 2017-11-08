class TrainingPlansController < ApplicationController

  def index
    @training_plans = TrainingPlan.all
  end

  def show
    @training_plan = TrainingPlan.find(params[:id])
  end
end
