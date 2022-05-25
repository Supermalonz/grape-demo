# frozen_string_literal: true

class ScrapWordWorker
  include Sidekiq::Worker

  def perform(param)
    case param
    when 'Test 1'
      sleep 20
      puts 'Test 1'
    when 'Test 2'
      sleep 10
      puts 'Test 2'
    end
  end
end
