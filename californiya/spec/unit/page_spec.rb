require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

include Capybara::DSL
Capybara.register_driver :selenium. do |app|
end

describe "Example page rander unit test " do
    it "Should show the Explore Californiya " do 
        visit('/')
        expect(page.has_selector? 'a.logo').to be true
    end
end