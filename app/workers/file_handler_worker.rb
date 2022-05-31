# frozen_string_literal: true

class FileHandlerWorker
  include Sidekiq::Worker
  sidekiq_options retry: 0, retry_queue: :default

  def perform(file)
    FileHandler.import(file)
  end
end
