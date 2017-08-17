require_relative 'boot'

require 'rails/all'

require 'slack-notifier'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TeamEchoProject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.available_locales = :en
    config.i18n.default_locale = :en

    config.action_mailer.delivery_method = :smtp
    # SMTP settings for gmail
    config.action_mailer.smtp_settings = {
      address: "smtp.gmail.com",
      port: 587,
      user_name: Rails.application.secrets.gmail_username,
      password: Rails.application.secrets.gmail_password,
      authentication: "plain",
      enable_starttls_auto: true,
      domain: Rails.application.secrets.mailer_domain
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
