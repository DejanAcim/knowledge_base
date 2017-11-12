class TrainingsController < ApplicationController
  before_action :require_user, except: [:show, :index]

  def show
    @training = Training.find(params[:id])
    @training_plans = @training.training_plans.paginate(page: params[:page], per_page: 4)
  end

  def index
    @trainings = Training.all
  end

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    if @training.save
      flash[:success] = "Training was created successfully"
      redirect_to training_plans_path
    else
      render 'new'
    end
  end

  private

    def training_params
      params.require(:training).permit(:name)
    end
end
