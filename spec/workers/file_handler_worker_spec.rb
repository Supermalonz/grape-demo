# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FileHandlerWorker, type: :worker do
  describe 'sidekiq_options' do
    it { is_expected.to be_processed_in :default }
    it { is_expected.to be_retryable 0 }
  end

  describe '#perform' do
    subject(:perform) { described_class.new.perform(file) }

    let(:file) { fixture_file_upload('/keywords.csv') }

    it 'import file' do
      allow(FileHandler).to receive(:import).with(file)
    end
  end
end
