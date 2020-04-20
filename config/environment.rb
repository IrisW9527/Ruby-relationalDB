# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.

Rails.application.configure do
    config.time_zone = "Eastern Time (US & Canada)"
    config.active_record.default_timezone = :local
    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
end

Rails.application.initialize!
