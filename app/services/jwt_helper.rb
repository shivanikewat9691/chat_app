module JwtHelper
  SECRET_KEY = Rails.application.secrets.secret_key_base

  def self.encode(payload, expiration = 24.hours.from_now)
    payload[:exp] = expiration.to_i
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
    decoded[0] if decoded
  rescue JWT::DecodeError
    nil
  end
end