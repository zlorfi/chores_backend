module JwtWrapper
  module_function

  def encode(payload, expiration = nil)
    expiration ||= Rails.application.credentials.jwt_expiration_hours

    payload = payload.dup
    payload['exp'] = expiration.to_i.hours.from_now.to_i

    JWT.encode(payload, Rails.application.credentials.jwt_secret)
  end

  def decode(token)
    decoded_token = JWT.decode(token, Rails.application.credentials.jwt_secret)
    decoded_token.first
  end
end
