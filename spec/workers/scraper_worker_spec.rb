# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ScraperWorker, type: :worker do
  describe 'sidekiq_options' do
    it { is_expected.to be_processed_in :default }
    it { is_expected.to be_retryable 0 }
  end

  describe '#perform' do
    subject(:perform) { described_class.new.perform(word) }
    let(:word)  { 'Apple' }
    it 'import file' do
      allow(ScraperService.instance).to receive(:call).with(word)
    end
  end
end
