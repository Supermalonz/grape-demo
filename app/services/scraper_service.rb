# frozen_string_literal: true

require 'nokogiri'
require 'selenium-webdriver'
require 'pry'

class ScraperService
  def selenium_options
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options
  end

  def selenium_capabilities_chrome
    Selenium::WebDriver::Remote::Capabilities.chrome
  end

  def driver_init
    driver = Selenium::WebDriver.for(:chrome, capabilities: [selenium_options, selenium_capabilities_chrome])
    begin
      driver.get('https://www.google.com/search?hl=en&q=apple')
      ads = driver.find_element(:tag_name, 'p')
      puts ads.text
    ensure
      driver.quit
    end
  end
end

scrape = ScraperService.new.driver_init
