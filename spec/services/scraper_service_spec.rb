# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ScraperService, type: :service do
  describe '#call' do
    subject(:call) do
      VCR.use_cassette '/fixtures/vcr_cassettes/google', match_requests_on: %i[uri] do
        described_class.instance.call('apple')
      end
    end

    context 'scrape ads_result' do
      it 'returns title and url' do
        pivot =
          [
            {
              header: 'Apple - ประเทศไทย',
              url: 'https://www.apple.com/th/'
            }
          ]
        subject
        expect(call[:ads_result]).to eq(pivot)
      end
    end

    context 'nonads_result' do
      it 'returns title and url' do
        pivot =
          [
            {
              header: 'Apple (Thailand)',
              url: 'https://www.apple.com/th/'
            },
            {
              header: 'Apple - BaNaNa',
              url: 'https://www.bnn.in.th/th/pages/apple'
            },
            {
              header: 'ราคา Apple พร้อมโปรโมชั่นราคาพิเศษ มิ.ย. 2022 - iPrice Thailand',
              url: 'https://ipricethailand.com/apple/'
            }
          ]
        VCR.use_cassette '/fixtures/vcr_cassettes', match_requests_on: %i[uri] do
          expect(call[:nonads_result]).to include(pivot)
        end
      end
    end

    context 'store_result' do
      it 'save result to the database' do
        expect { subject }.to change(Keyword, :count).by(1) and change(SearchResult, :count).by(7)
      end
    end
  end
end
