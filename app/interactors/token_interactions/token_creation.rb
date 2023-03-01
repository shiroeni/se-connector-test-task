# frozen_string_literal: true

module TokenInteractions
  # Creates new token
  class TokenCreation < BaseInteraction
    def initialize(params)
      @params = params
    end

    # @param [Hash<any>] params
    def call
      token = Token.create(
        token: SecureRandom.uuid,
        refresh_token: SecureRandom.uuid,
        # client_id: params[:client_id]
        expires_at: 1.day.from_now
      )

      Success(token)
    end

    private

    attr_reader :params
  end
end
