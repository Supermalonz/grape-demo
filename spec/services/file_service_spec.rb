# frozen_string_literal: true

require 'rails_helper'

describe FileService, type: :service do
  describe '#upload' do
    subject { described_class.file_control(file) }

    let(:file) { fixture_file_upload('/keywords.csv') }

    it 'invalid file type : rescure message' do
      allow(FileService).to receive(:file_control).and_raise(FileService::FileTypeError)
      expect { subject }.to raise_error(FileService::FileTypeError)
    end

    it 'CSV has more than 1000 rows' do
      allow(FileService).to receive(:file_control).and_raise(FileService::FileTooBigError)
      expect { subject }.to raise_error(FileService::FileTooBigError)
    end

    it 'empty CSV file' do
      allow(FileService).to receive(:file_control).and_raise(FileService::FileEmptyError)
      expect { subject }.to raise_error(FileService::FileEmptyError)
    end
  end
end
