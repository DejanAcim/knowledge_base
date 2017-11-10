class TrainingsController < ApplicationController

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    if @training.save
      flash[:success] = "Training was created succesfully"
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
