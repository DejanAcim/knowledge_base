class SkillsController < ApplicationController

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      flash[:success] = "Skill was created succesfully"
      redirect_to training_plans_path
    else
      render 'new'
    end
  end

  private

    def skill_params
      params.require(:skill).permit(:name)
    end
end
