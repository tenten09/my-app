module Jwt::UserAuthenticator
  extend self

  def call(request_headers)
    @request_headers = request_headers
    begin
      payload, = Jwt::TokenDecryptor.call(token)
      # logger.info(payload.inspect)
      User.find(payload['user_id'])
      # logger.info(user.inspect)
    rescue => e
      puts e.backtrace
    end
  end

  private

  def token
    puts "Authorization:"  + @request_headers['Authorization']
    @request_headers['Authorization'].split(' ').last
  end
end 