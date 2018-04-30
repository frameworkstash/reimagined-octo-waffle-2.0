require 'jwt'

class Auth
  def self.issue(payload)
    JWT.encode(
      payload,
      secret,
      algorithm
    )
  end

  def self.decode(token)
    JWT.decode(
      token,
      secret,
      true,
      { algorithm: algorithm }
    )
  end

  private
    def self.secret
      ENV['HMAC_SECRET']
    end

    def self.algorithm
      ENV['HMAC_ALGORITHM']
    end
end
