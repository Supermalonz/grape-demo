# frozen_string_literal: true

class FileHandlerWorker
  include Sidekiq::Worker
  sidekiq_options retry: 10, retry_queue: :default

  def perform(file)
    FileHandler.import(file)
  end
end
