class Api::CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authorize_request

  def index
    comments = Comment.where(post_id: params[:post_id])
    json_response(comments)
  end

  def create
    @new_comment = Comment.create(
      text: comment_params,
      author_id: params[:user_id],
      post_id: params[:post_id]
    )
    json_response(@new_comment, :created)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
