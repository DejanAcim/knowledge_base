class CommentsController < ApplicationController
  before_action :require_user, except: [:show, :index]

  def create
    @training_plan = TrainingPlan.find(params[:training_plan_id])
    @comment = @training_plan.comments.new(comment_params)
    @comment.user = current_user
    @comment.save!

    redirect_to training_plan_path(@training_plan)
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
