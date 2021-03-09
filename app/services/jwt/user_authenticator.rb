module Jwt::UserAuthenticator
  extend self

  def call(request_headers)
    @request_headers = request_headers
    begin
      payload, _ = Jwt::TokenDecryptor.(token)
      return User.find(payload['user_id'])
      logger.info(current_user.inspect)
    rescue
      return nil
    end
  end

  def token
    @request_headers['Authorization'].split(' ').last
  end
end 