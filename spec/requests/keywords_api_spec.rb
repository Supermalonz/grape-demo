# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::KeywordsAPI, type: :api do
  subject(:call) { call_api(params) }

  let(:params) { {} }
  let!(:search_result_a) { create(:search_result, :nonads) }
  let!(:search_result_b) { create(:search_result, :ads) }

  describe 'GET /keywords/all' do
    it 'return status 200' do
      expect(call.status).to eq 200
    end

    it 'return all data' do
      json_results = JSON.parse(ActiveModelSerializers::SerializableResource.new(SearchResult.all, each_serializer: SearchResultSerializer).to_json)
      call_body = JSON.parse(JSON.parse(call.body)['data'])
      expect(call_body).to match_array json_results
    end
  end

  describe 'GET /keywords/adswords' do
    it 'return status 200' do
      expect(call.status).to eq 200
    end

    it 'check returned data' do
      expected_result = 'apple : 1'
      expect(JSON.parse(call.body)).to eq expected_result
    end
  end

  describe 'GET /keywords/ads' do
    it 'return status 200' do
      expect(call.status).to eq 200
    end

    it 'check returned data' do
      json_results = JSON.parse(ActiveModelSerializers::SerializableResource.new(search_result_b, each_serializer: SearchResultSerializer).to_json)
      call_body = JSON.parse(JSON.parse(call.body)['data'])[0]
      expect(call_body).to match_array json_results
    end
  end

  describe 'GET /keywords/non_ads' do
    it 'return status 200' do
      expect(call.status).to eq 200
    end

    it 'check returned data' do
      json_results = JSON.parse(ActiveModelSerializers::SerializableResource.new(search_result_a, each_serializer: SearchResultSerializer).to_json)
      call_body = JSON.parse(JSON.parse(call.body)['data'])[0]
      expect(call_body).to match_array json_results
    end
  end

  describe 'GET /keywords/contains' do
    it 'return status 200' do
      expect(call.status).to eq 200
    end

    it 'check returned data' do
      params[:query] = 'apple'
      expect(JSON.parse(call.body)).to eq 'apple : 2'
    end
  end

  describe 'POST /keywords/csv' do
    let(:file) { fixture_file_upload('/keywords.csv') }
    let(:valid_file) { fixture_file_upload('/none-csv-file.png') }
    let(:too_big_file) { fixture_file_upload('/too-big-file.csv') }
    let(:empty_file) { fixture_file_upload('/empty-csv-file.csv') }

    it 'return status 200 if upload csv files' do
      params[:csv] = file
      expect(call.status).to eq 200
    end

    it 'empty file' do
      expect(JSON.parse(call.body)['error']).to eq 'csv is missing'
    end

    it 'invalid file type : rescure message' do
      params[:csv] = valid_file
      expect(JSON.parse(call.body)['error']).to eq 'FileService::FileTypeError'
    end

    it 'CSV has more than 1000 rows' do
      params[:csv] = too_big_file
      expect(JSON.parse(call.body)['error']).to eq 'FileService::FileTooBigError'
    end

    it 'empty CSV file' do
      params[:csv] = empty_file
      expect(JSON.parse(call.body)['error']).to eq 'FileService::FileEmptyError'
    end
    #If inserting empty csv file, it will get error. Fixing on it
  end
end
