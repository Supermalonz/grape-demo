# frozen_string_literal: true

module V1
  class KeywordsAPI < Grape::API

    namespace :keywords do
      desc 'Get /api/v1/keywords/all' do
        summary 'Get all result'
      end
      get do
        result = SearchResult.all
        render_json(:ok, result.as_json)
      end

      desc 'Get /api/v1/keywords/ads' do
        summary 'Get ads'
      end
      get :ads do
        result = SearchResult.where(is_ads: true)
        render_json(:ok, result.as_json)
      end

      desc 'Get /api/v1/keywords/non_ads' do
        summary 'Get non-ads'
      end
      get :non_ads do
        result = SearchResult.where(is_ads: false)
        render_json(:ok, result.as_json)
      end

      desc 'Post /api/v1/keywords/csv' do
        summary 'Post CSV file'
      end
      params do
        requires :csv, type: File, desc: 'CSV file'
      end
      post :csv do
        file = ActionDispatch::Http::UploadedFile.new(params[:csv])
        FileService.file_control(file)
        FileHandler.import(file)
        render_json(:ok, 'Upload Success')
      rescue FileService::FileTooBigError,  FileService::FileTypeError, FileService::FileEmptyError => e
        error!(e, 422)
      end
    end
  end
end
