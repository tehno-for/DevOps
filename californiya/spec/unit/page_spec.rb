require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

include Capybara::DSL
Capybara.app_host = "http://website:8000"
Capybara.server_host = "localhost"
Capybara.server_port = "8000"
Capybara.run_server = false
Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(
        app,
        :browser => :remote,
        :url => "http://#{ENV['SELENIUM_HOST']}:#{ENV['SELENIUM_PORT']}/wd/hub",
        :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
            "chromeOptions" => {"args" => 
                ['--no-default-browser-check',
                '--disable-dev-shm-usage']
            }
        )
    )
end
Capybara.default_driver = :selenium

describe "Example page rander unit test " do
    it "Should show the Explore Californiya " do 
        visit('/')
        expect(page.has_selector? 'a.logo').to be true
    end
end