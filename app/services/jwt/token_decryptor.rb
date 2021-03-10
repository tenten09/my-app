module Jwt::TokenDecryptor
  extend self

  def call(token)
    decrypt(token)
  end

  private

  def decrypt(token)
    JWT.decode(token, Rails.application.credentials.secret_key_base)
  rescue => e 
    puts "secret_key_base"
    raise e
  end
end
class InvalidTokenError < StandardError; end