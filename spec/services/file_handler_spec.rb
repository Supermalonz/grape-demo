# frozen_string_literal: true

require 'rails_helper'

describe FileHandler, type: :service do
  describe '#Import' do
    subject { described_class.import(file) }

    let(:file) { fixture_file_upload('/keywords.csv') }

    it 'enques jobs' do
      subject
      expect(ScraperWorker).to have_enqueued_sidekiq_job('Apple')
      expect(ScraperWorker).to have_enqueued_sidekiq_job('Intel')
      expect(ScraperWorker).to have_enqueued_sidekiq_job('AMD')
    end
  end
end
