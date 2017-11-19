class CommentsController < ApplicationController
  before_action :require_user, except: [:show, :index]

  def create
    @training_plan = TrainingPlan.find(params[:training_plan_id])
    @comment = @training_plan.comments.new(comment_params)
    @comment.user = current_user
    @comment.save!

    respond_to do |format|
      format.html { redirect_to @training_plan }
      format.js
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
