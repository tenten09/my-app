module Jwt::TokenDecryptor
  extend self

  def call(token)
    decrypt(token)
  end

  private

  def decrypt(token)
    JWT.decode(token, Rails.application.credentials.secret_key_base)
  rescue StandardError
    puts "secret_key_base" + Rails.application.credentials.secret_key_base
    puts "env_secret" + ENV["SECRET_KEY_BASE"]
    raise InvalidTokenError
  end
end
class InvalidTokenError < StandardError; end