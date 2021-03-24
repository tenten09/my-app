class Api::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :authenticate, only: %i[create update destroy]

  def index
    posts = Post.includes(:user).order(created_at: :desc)
    render json: posts, each_serializer: PostSerializer
  end

  def show
    post = Post.find(params[:id])
    render json: post, serializer: PostSerializer
  end

  def create
    post = current_user.posts.create!(post_params)
    render json: post, serializer: PostSerializer
  end

  def update
    post = current_user.posts.find(params[:id])
    post.update!(post_params)
    render json: post, serializer: PostSerializer
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    render json: post, serializer: PostSerializer
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end