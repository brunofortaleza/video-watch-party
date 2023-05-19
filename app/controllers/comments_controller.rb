class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(content: comment_params[:content], room_id: params[:format])

    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  private

  def comment_params
    params.permit(:content)
  end
end
