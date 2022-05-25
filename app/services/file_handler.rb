# frozen_string_literal: true
class FileHandler
  def self.import(file)
    i = 0
    SmarterCSV.process(file).each do |row|
      if i == 10
        sleep rand(1..15)
        i = 0
      end
      ScraperWorker.perform_async(row[:title])
      i += 1
    end
  end
end
