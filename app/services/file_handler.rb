class FileService
  def self.import(file)
    SmarterCSV.process(file.path) do |element|
      ScraperService.perform_async(element.map { |e| e[:keyword]})
    end
  end
end
