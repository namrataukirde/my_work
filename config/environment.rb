# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
Rails.application.config.assets.precompile += %w( depot.css )
