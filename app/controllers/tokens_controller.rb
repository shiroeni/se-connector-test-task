# frozen_string_literal: true

# Controller that handles tokens
class TokensController < ApplicationController
  class Error < StandardError; end

  include JwtAuthable
  include Dry::Monads[:result]

  rescue_from StandardError do |exception|
    render json: {
      error: exception.class.name,
      message: exception.message
    }, status: 500
  end

  rescue_from Error do |exception|
    render json: {
      error: 'Bad request',
      message: exception.message
    }, status: :bad_request
  end

  # POST /
  def create
    result = TokensInteractor.new.call(tokens_params)

    case result
    in Success(Token)
      redirect_to tokens_params[:callback_uri], allow_other_host: true
    in Failure(String)
      raise Error, result.failure
    end
  end

  private

  def tokens_params
    params.require(:tokens).permit(
      :callback_uri
    )
  end
end
