# frozen_string_literal: true

module V1
  class KeywordsAPI < Grape::API
    namespace :keywords do
      desc 'Get /api/v1/keywords/adswords' do
        summary 'Get word that contains Adwords the most'
      end
      get :adswords do
        keywords = Keyword.all
        pivot = keywords.each_with_object({}) do |keyword, hash|
          key_id = keyword.title.to_sym
          hash[key_id] = SearchResult.where(is_ads: true, keyword_id: keyword.id).size
        end
        key_result = pivot.key(pivot.values.max)
        value_result = pivot[pivot.key(pivot.values.max)]
        render_json(:ok, "#{key_result} : #{value_result}")
      end

      desc 'Get /api/v1/keywords/all' do
        summary 'Get all result'
      end
      get :all do
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

      desc 'Get /api/v1/keywords/contains' do
        summary 'Get URLs contains the word'
      end
      params do
        optional :query, type: String, desc: 'Query string'
      end
      get :contains do
        result = SearchResult.where("url LIKE '%#{params[:query]}%'").size
        render_json(:ok, "#{params[:query]} : #{result}")
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
      rescue FileService::FileTooBigError, FileService::FileTypeError, FileService::FileEmptyError => e
        error!(e, 422)
      end
    end
  end
end
