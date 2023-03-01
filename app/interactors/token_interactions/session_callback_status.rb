# frozen_string_literal: true

module TokenInteractions
  # Changes session status
  class SessionCallbackStatus < BaseInteraction
    def initialize(status)
      @status = status
    end

    # @param [String, Symbol] status
    def call
      Net::HTTP.start(uri.host, uri.port) do |http|
        request = Net::HTTP::Post.new(uri.request_uri, 'Authorization' => "Bearer #{jwt_token}")
        request.body = { 'sessionStatus' => status }.to_json

        http.request request
      end

      Success(true)
    rescue StandardError => e
      Failure(e.message)
    end

    private

    attr_reader :status

    def uri
      @uri ||= URI.parse(Settings.config.compliance_status_url)
    end

    def jwt_token
      @jwt_token = JwtService.encode(data: 'sessionStatus')
    end
  end
end
