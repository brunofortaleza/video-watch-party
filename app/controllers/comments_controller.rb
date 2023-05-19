class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(content: comment_params[:content], room_id: params[:format])

    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to rooms_path, alert: 'Erro ao criar o comentário.'
    end
  end

  private

  def comment_params
    params.permit(:content)
  end
end
