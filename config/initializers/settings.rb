# frozen_string_literal: true

# Settings object
class Settings < KingKonf::Config
  class << self
    def config
      @config ||=
        begin
          config = Settings.new
          config.load_file('config/settings.yml', Rails.env)
          config.validate!
          config
        end
    end
  end

  env_prefix :app

  string :compliance_callback_url
  string :compliance_status_url
end
