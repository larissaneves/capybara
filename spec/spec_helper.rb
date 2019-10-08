require "capybara"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL

  config.before(:example) do
    page.current_window.resize_to(1280,800)
  end

  ## imprime todos os cenarios
  config.after(:example) do |e|   
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, ''). tr(' ', '_') #expressão regular que substitui o caracter especial por nada
    page.save_screenshot('log/' + nome + '.png')
  end

  # ## imprime apenas os que falharam
  # config.after(:example) do |e|   
  #   nome = e.description.gsub(/[^A-Za-z0-9 ]/, ''). tr(' ', '_') #expressão regular que substitui o caracter especial por nada
  #   page.save_screenshot('log/' + nome + '.png') if e.exception
  # end
end

Capybara.configure do |config|
  #config.default_driver = :selenium_chrome  #executar (visualizando o browser)
  config.default_driver = :selenium_chrome_headless #executar em headless (de forma invisivel)
  config.default_max_wait_time = 15
  config.app_host = "http://training-wheels-protocol.herokuapp.com"
end
