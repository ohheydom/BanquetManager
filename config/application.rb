require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

if File.exists?(File.expand_path('../application.yml', __FILE__))
  config = YAML.load(File.read(File.expand_path('../application.yml', __FILE__)))
  config.merge! config.fetch(Rails.env, {})
  config.each do |key, value|
    ENV[key] ||= value.to_s unless value.kind_of? Hash
  end
end

module BanquetManager
  class Application < Rails::Application
  end
end
