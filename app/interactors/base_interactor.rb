# frozen_string_literal: true

class BaseInteractor
  include Dry::Monads[:result]
  include Dry::Monads::Do.for(:call)

  # @param [String] params
  def call(params)
    raise NotImplementedError, 'Method must be implemented in subclass'
  end
end
