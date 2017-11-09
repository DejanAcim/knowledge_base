class PagesController < ApplicationController

  def home
    redirect_to training_plans_path if logged_in?
  end
end
