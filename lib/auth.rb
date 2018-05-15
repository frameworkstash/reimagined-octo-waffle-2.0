class Auth
  def self.encode(payload, exp = 24.hours.from.now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, secret, algorithm)
  end

  def self.decode(token)
    body = JWT.decode(token, secret, true, { algorithm: algorithm })
    HashWithIndifferentAccess.new body
  rescue
    nil
  end

  private
    def self.secret
      ENV['HMAC_SECRET']
    end

    def self.algorithm
      ENV['HMAC_ALGORITHM']
    end
end
