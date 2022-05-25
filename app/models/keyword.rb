class Keyword < ApplicationRecord
  has_many :search_results, dependent: :destroy

  def self.import(file)
    SmarterCSV.process(file.path) do |element|
      ScraperService.perform_async(element.map { |e| e[:keyword]})
    end
  end
end
