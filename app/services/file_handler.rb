# frozen_string_literal: true
class FileHandler
  def self.import(file)
    SmarterCSV.process(file).each do |row|
      wait_time = rand(1..15).seconds.from_now
      ScraperWorker.perform_at(wait_time, row[:title])
    end
  end
end
