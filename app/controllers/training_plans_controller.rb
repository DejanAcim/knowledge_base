class TrainingPlansController < ApplicationController

  def index
    @training_plans = TrainingPlan.all
  end

  def show
    @training_plan = TrainingPlan.find(params[:id])
  end

  def new
    @training_plan = TrainingPlan.new
  end

  def create
    @training_plan = TrainingPlan.new(training_plan_params)
    @training_plan.user = User.find(1) # hardcoded for now

    if @training_plan.save
      flash[:success] = "Your Training Plan was created succesfully!"
      redirect_to training_plans_path
    else
      render :new
    end
  end

  private

    def training_plan_params
      params.require(:training_plan).permit(:name, :description)
    end
end
