require 'webmock/rspec'
require 'support/request_helper'
require 'whiz_client'


RSpec.configure do |config|
  config.color = true
  config.order = "rand"

  # Filters
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.filter_run_excluding :broken


  # WebMock
  config.before(:each, type: :feature, js: true) do
    WebMock.disable_net_connect!(allow_localhost: true)
  end

  config.after(:each, type: :feature, js: true) do
    WebMock.disable_net_connect!
  end
end