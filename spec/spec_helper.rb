# frozen_string_literal: true

Dir.glob("spec/steps/*steps.rb") { |f| load f, true }

require "capybara/rspec"
require "capybara/poltergeist"

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    inspector: true,
    js_errors: true,
    timeout: 1000,
    phantomjs_options: [
      "--load-images=no",
      "--ignore-ssl-errors=yes",
      "--ssl-protocol=any"
    ]
  )
end

Capybara.default_driver = :poltergeist
