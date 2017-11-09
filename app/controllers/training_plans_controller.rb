class TrainingPlansController < ApplicationController

  def index
    @training_plans = TrainingPlan.all.sort_by{|likes| likes.thumbs_up_total}.reverse
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

  def edit
    @training_plan = TrainingPlan.find(params[:id])
  end

  def update
    @training_plan = TrainingPlan.find(params[:id])
    if @training_plan.update(training_plan_params)
      flash[:succes] = "Your Training Plan was updated succesfuly"
      redirect_to training_plan_path(@training_plan)
    else
      render :edit
    end
  end

  def like
    @training_plan = TrainingPlan.find(params[:id])
    like = Like.create(like: params[:like], user: User.first, training_plan: @training_plan) # user hardcoded for now
    if like.valid?
      flash[:succes] = "Your selection was succesful"
      redirect_back fallback_location: root_path
    else
      flash[:danger] = "You can only like/dislike a Training Plan once"
      redirect_back fallback_location: root_path
    end
  end

  private

    def training_plan_params
      params.require(:training_plan).permit(:name, :description)
    end
end
