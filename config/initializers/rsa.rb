# frozen_string_literal: true

class Rsa
  class << self
    def instance
      @instance = OpenSSL::PKey::RSA.new(File.read(File.join('config/key.pem')), 'pass')
    end
  end
end
