class FileService
  MAX_ROWS = 1000

  class FileTooBigError < StandardError; end
  class FileEmptyError < StandardError; end
  class FileTypeError < StandardError; end

  class FileTooBigError
    'Your CSV has more than 1000 rows.'
  end

  class FileEmptyError
    'Please upload your CSV file.'
  end

  class FileTypeError
    'Please upload .csv file'
  end

  def self.file_control(file)
    raise FileEmptyError if file.blank?
    raise FileTooBigError if IO.readlines(file).size > MAX_ROWS
    raise FileTypeError unless File.extname(file).include? %w[.csv]
  end
end
