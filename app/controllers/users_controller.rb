class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your account has been created successfully"
      redirect_to training_plans_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your profile has been updated successfully"
      redirect_to training_plans_path #ToDo change to show user page
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @training_plans = @user.training_plans.paginate(page: params[:page], per_page: 3)
  end

  private

    def user_params
      params.require(:user).permit(:name, :surname, :email, :password)
    end
end