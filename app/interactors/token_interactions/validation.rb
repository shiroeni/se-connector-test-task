# frozen_string_literal: true

module TokenInteractions
  # Validates params
  class Validation < BaseInteraction
    def initialize(params)
      @params = params
    end

    def call
      if params[:callback_uri].present?
        Success(true)
      else
        Failure('Invalid `:callback_uri`')
      end
    end

    private

    attr_reader :params
  end
end
