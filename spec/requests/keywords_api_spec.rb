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
      json_results = ActiveModelSerializers::SerializableResource.new(SearchResult.all, each_serializer: SearchResultSerializer).to_json
      call_body = JSON.parse(call.body)['data']
      expect(call_body).to eq json_results
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
      json_results = ActiveModelSerializers::SerializableResource.new(SearchResult.where(is_ads: true), each_serializer: SearchResultSerializer).to_json
      call_body = JSON.parse(call.body)['data']
      expect(call_body).to eq json_results
    end
  end

  describe 'GET /keywords/non_ads' do
    it 'return status 200' do
      expect(call.status).to eq 200
    end

    it 'check returned data' do
      json_results = ActiveModelSerializers::SerializableResource.new(SearchResult.where(is_ads: false), each_serializer: SearchResultSerializer).to_json
      call_body = JSON.parse(call.body)['data']
      expect(call_body).to eq json_results
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
      allow(FileService).to receive(:file_control).and_raise(FileService::FileTooBigError)
      params[:csv] = file
      expect(JSON.parse(call.body)['error']).to eq 'FileService::FileTooBigError'
    end

    it 'empty CSV file' do
      allow(FileService).to receive(:file_control).and_raise(FileService::FileEmptyError)
      params[:csv] = file
      expect(JSON.parse(call.body)['error']).to eq 'FileService::FileEmptyError'
    end
  end
end
