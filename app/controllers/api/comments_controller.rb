class Api::CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authorize_request

  def index
    comments = Comment.where(post_id: params[:post_id])
    json_response(comments)
  end
end
