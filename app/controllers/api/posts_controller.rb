class Api::PostsController < ApplicationController
  before_action :authorize_request

  def index
    posts = Post.where(author_id: params[:user_id])
    json_response(posts)
  end
end
