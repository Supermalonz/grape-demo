# frozen_string_literal: true

class ScraperService
  include Singleton

  def call(word)
    @word = word
    driver_init
    search_result = result
    store_result
    driver.quit

    search_result
  end

  private

  attr_reader :word
  attr_accessor :driver, :doc, :serarch_result

  def driver_init
    @driver = Selenium::WebDriver.for(:chrome, capabilities: [selenium_options, selenium_capabilities_chrome])
    @driver.get("https://www.google.com/search?q=#{word}")
  end

  def ads_result
    ads_array = []
    ads_listings = doc.css('div#tads').each do |ads_listing|
      ads = {
        header: ads_listing.css('div a span').first.text,
        url: ads_listing.css('@href').first.text
      }
      ads_array << ads
    end
    ads_array.reject { |e| e[:header].empty? }
  end

  def nonads_result
    nonads_array = []
    nonads_listings = doc.css('div.g').each do |nonads_listing|
      non_ads = {
        header: nonads_listing.css('h3').text,
        url: nonads_listing.css('a @href').first.text
      }
      nonads_array << non_ads
    end
    nonads_array.reject { |e| e[:header].empty? }
  end

  def result
    @doc = Nokogiri::HTML(driver.page_source)
    {
      ads_result: ads_result,
      nonads_result: nonads_result
    }
  end

  def selenium_options
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options
  end

  def selenium_capabilities_chrome
    Selenium::WebDriver::Remote::Capabilities.chrome
  end

  def store_result
    keyword = Keyword.new(title: word)
    return unless keyword.save

    ads_result.each do |ads|
      ads = ads.deep_symbolize_keys
      SearchResult.create(header: ads[:header], url: ads[:url], is_ads: true, keyword: keyword)
    end

    nonads_result.each do |nonads|
      nonads = nonads.deep_symbolize_keys
      SearchResult.create(header: nonads[:header], url: nonads[:url], is_ads: false, keyword: keyword)
    end
  end
end
