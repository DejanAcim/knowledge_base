class TrainingPlansController < ApplicationController
  before_action :set_training_plan, only [:edit, :update, :show, :like]
  before_action :require_same_user, only [:edit, :update]

  def index
    @training_plans = TrainingPlan.paginate(page: params[:page], per_page: 4)
  end

  def show
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
  end

  def update
    if @training_plan.update(training_plan_params)
      flash[:succes] = "Your Training Plan was updated succesfuly"
      redirect_to training_plan_path(@training_plan)
    else
      render :edit
    end
  end

  def like
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

    def set_training_plan
      @training_plan = TrainingPlan.find(params[:id])
    end

    def require_same_user
      if current_user != @training_plan.user
        flash[:danger] = "You can only edit your own Training Plans"
        redirect_to training_plan_path
      end
    end
end
