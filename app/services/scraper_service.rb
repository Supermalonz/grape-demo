# frozen_string_literal: true

class ScraperService
  attr_accessor :driver, :doc

  def selenium_options
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options
  end

  def selenium_capabilities_chrome
    Selenium::WebDriver::Remote::Capabilities.chrome
  end

  def driver_init
    @driver = Selenium::WebDriver.for(:chrome, capabilities: [selenium_options, selenium_capabilities_chrome])
    @driver.get('https://www.google.com/search?hl=en&q=apple')
  end

  def ads_result
    ads_array = Array.new
    ads_listings = doc.css('div#tads').each do |ads_listing|
      ads = {
        header: ads_listing.css('div a span').first.text,
        url: ads_listing.css('@href').first.text
      }
      ads_array << ads
    end
  end

  def nonads_result
    nonads_array = Array.new
    nonads_listings = doc.css('div.g').each do |nonads_listing|
      non_ads = {
        header: nonads_listing.css('h3').text,
        url: nonads_listing.css('a @href').first.text
      }
      nonads_array << non_ads
    end
  end

  def result
    @doc = Nokogiri::HTML(driver.page_source)
    {
      ads_result: ads_result,
      nonads_result: nonads_result
    }
  end
end
