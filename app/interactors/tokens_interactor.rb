# frozen_string_literal: true

# Creation token pipeline
class TokensInteractor < BaseInteractor
  include Dry::Monads[:result]
  include Dry::Monads::Do.for(:call)

  # @param [Hash] token_params
  def call(token_params)
    _ = yield TokenInteractions::Validation.new(token_params).call
    _ = yield TokenInteractions::SessionCallbackStatus.new(status: :update).call
    token_result = yield TokenInteractions::TokenCreation.new(token_params).call
    _ = yield TokenInteractions::SessionCallbackStatus.new(status: :success).call

    Success(token_result)
  end
end
