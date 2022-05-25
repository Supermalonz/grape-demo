# frozen_string_literal: true

class FileHandlerWorker
  include Sidekiq::Worker

  def perform(file)
    FileHandler.import(file)
  end
end
