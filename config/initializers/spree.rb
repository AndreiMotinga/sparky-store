# Configure Solidus Preferences
# http://docs.solidus.io/Spree/AppConfiguration.html

Spree.config do |config|
  config.use_static_preferences!
  config.allow_guest_checkout = false
  config.address_requires_state = false
  config.default_country_iso = "MD"

  # Core:

  # Default currency for new sites
  config.currency = "MDL"
  config.products_per_page = 20
  config.max_level_in_taxons_menu = 5
  config.mails_from = "info@sparky.md"

  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false

  # When set, product caches are only invalidated when they fall below or rise
  # above the inventory_cache_threshold that is set. Default is to invalidate cache on
  # any inventory changes.
  # config.inventory_cache_threshold = 3

  # Frontend:
  config.logo = "sparky/logo.png"

  # Admin:
  config.admin_interface_logo = "sparky/logo.png"

  # Gateway credentials can be configured statically here and referenced from
  # the admin. They can also be fully configured from the admin.
  #
  # config.static_model_preferences.add(
  #   Spree::Gateway::StripeGateway,
  #   'stripe_env_credentials',
  #   secret_key: ENV['STRIPE_SECRET_KEY'],
  #   publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  #   server: Rails.env.production? ? 'production' : 'test',
  #   test_mode: !Rails.env.production?
  # )
end

Spree::Frontend::Config.configure do |config|
  config.use_static_preferences!
  config.locale = :ru
end

Spree::Backend::Config.configure do |config|
  config.use_static_preferences!
  config.locale = :ru
end

Spree::Api::Config.configure do |config|
  config.use_static_preferences!
  config.requires_authentication = true
end

Spree.user_class = "Spree::LegacyUser"
SolidusI18n::Config.available_locales = [:ru, :ro]
SolidusGlobalize::Config.supported_locales = [:ru, :ro]
