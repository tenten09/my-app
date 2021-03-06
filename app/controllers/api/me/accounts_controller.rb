class Api::Me::AccountsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :authenticate

  def update
    current_user.update(user_params)
    render json: current_user, serializer: UserSerializer
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :avatar, avatar: :data)
  end
end