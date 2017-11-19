class TrainingPlansController < ApplicationController
  before_action :set_training_plan, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user_or_admin, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]

  def index
    @training_plans = TrainingPlan.paginate(page: params[:page], per_page: 4)
  end

  def show
    @comments = @training_plan.comments.all
  end

  def new
    @training_plan = TrainingPlan.new
  end

  def create
    @training_plan = TrainingPlan.new(training_plan_params)
    @training_plan.user = current_user

    if @training_plan.save
      flash[:success] = "Your Training Plan was created successfully!"
      redirect_to training_plans_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @training_plan.update(training_plan_params)
      flash[:success] = "Your Training Plan was updated successfully"
      redirect_to training_plan_path(@training_plan)
    else
      render :edit
    end
  end

  def destroy
    TrainingPlan.find(params[:id]).destroy
    flash[:success] = "Training Plan deleted."
    redirect_to training_plans_path
  end

  def like
    like = Like.create(like: params[:like], user: current_user, training_plan: @training_plan)
    if like.valid?
      flash[:success] = "Your selection was successful"
      redirect_back fallback_location: root_path
    else
      flash[:danger] = "You can only like/dislike a Training Plan once"
      redirect_back fallback_location: root_path
    end
  end

  private

    def training_plan_params
      params.require(:training_plan).permit(:name, :description, skill_ids: [], training_ids: [])
    end

    def set_training_plan
      @training_plan = TrainingPlan.find(params[:id])
    end

    def require_same_user_or_admin
      if current_user != @training_plan.user and !current_user.admin?
        flash[:danger] = "You can only edit your own Training Plans"
        redirect_to training_plan_path
      end
    end

    def admin_user
      redirect_to training_plans_path unless current_user.admin?
    end
end
