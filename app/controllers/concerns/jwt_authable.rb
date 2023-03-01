# frozen_string_literal: true

# Mixin for work with JWT from controllers
module JwtAuthable
  extend ActiveSupport::Concern

  included do
    private
    def render_json(params)
      render json: payload
    end

    def payload(attrs)
      { 
        data: {
          user_id: current_user.id,
          
        }  
      }
    end

    def token
      JwtService.encode(payload)
    end
  end
end
