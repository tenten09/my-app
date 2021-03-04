class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  class AuthenticationError < StandardError; end

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActiveRecord::RecordInvalid, with: :render_422
  rescue_from AuthenticationError, with: :not_authenticated

  def authenticate
    raise AuthenticationError unless current_user
  end

  def current_user
    @current_user ||= Jwt::UserAuthenticator.(request.headers)
  end

  private

  def render_404(exception)
    render json: { error: { messages: exception.message } }, status: :not_found
  end

  def render_422(exception)
    render json: { error: { messages: exception.record.errors.full_messages } }, status: :unprocessable_entity
  end

  def not_authenticated
    render json: { error: { messages: ['ログインしてください'] } }, status: :unauthorized
  end
end
