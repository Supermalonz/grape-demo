# frozen_string_literal: true

class ScraperWorker
  include Sidekiq::Worker

  def perform(word)
    ScraperService.instance.call(word)
  end
end
