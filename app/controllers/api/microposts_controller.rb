class Api::MicropostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :authenticate, only: %i[create update destroy]

  def index
    microposts = Micropost.includes(:user).order(created_at: :desc)
    render json: microposts, each_serializer: MicropostSerializer
  end

  def show
    micropost = Micropost.find(params[:id])
    render json: micropost, serializer: MicropostSerializer
  end

  def create
    logger.info(current_user.inspect)
    # logger.info "current_user: #{current_user.attributes.inspect}"
    micropost = current_user.microposts.create!(micropost_params)
    render json: micropost, serializer: MicropostSerializer
  end

  def update
    micropost = current_user.microposts.find(params[:id])
    micropost.update!(micropost_params)
    render json: micropost, serializer: MicropostSerializer
  end

  def destroy
    micropost = current_user.microposts.find(params[:id])
    micropost.destroy!
    render json: micropost, serializer: MicropostSerializer
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end    
end