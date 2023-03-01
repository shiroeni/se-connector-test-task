# frozen_string_literal: true

module JwtService
  class << self
    # @param [Hash, String] payload
    # @return [String]
    def encode(payload)
      JwtService::Encoder.new(payload).encode
    end

    # @param [String] token
    # @param [Symbol] type Settings type
    # @return [Array<Hash>]
    def decode(token)
      JwtService::Decoder.new(token).decode
    end
  end

  # Encoder class for JWT
  class Encoder
    # @param [any] payload
    # @param [Settings] settings
    def initialize(payload)
      @payload = payload
      @private_key = Rsa.instance.public_key.to_s
    end

    # Generates JWT from payload
    #
    # @return [String]
    def encode
      JWT.encode(
        payload,
        private_key,
        'HS256'
      )
    end

    private

    attr_reader :payload, :private_key
  end

  # Decoder class for JWT
  class Decoder
    # @param [String] token
    # @param [Settings] settings
    def initialize(token)
      @token = token
      @public_key = Rsa.instance.public_key.to_s
    end

    # Decodes token
    #
    # @return [Array<Hash>]
    def decode
      JWT.decode(
        token,
        public_key,
        true,
        { algorithm: 'HS256' }
      )
    end

    private

    attr_reader :token, :public_key
  end
end
