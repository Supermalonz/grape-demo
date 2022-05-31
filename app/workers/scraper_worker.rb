# frozen_string_literal: true

class ScraperWorker
  include Sidekiq::Worker
  sidekiq_options retry: 10, retry_queue: :default

  def perform(word)
    ScraperService.instance.call(word)
  end
end
