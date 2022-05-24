# frozen_string_literal: true

class Schedule::HourlyWorker
  include Sidekiq::Worker

  sidekiq_options queue: :schedule

  def perform
    puts 'Running every hour'
  end
end
