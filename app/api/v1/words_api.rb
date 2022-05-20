# frozen_string_literal: true

module V1
  class WordsAPI < Grape::API
    helpers do
      def word_params
        params.slice(
          :title
        )
      end
    end

    namespace :words do
      desc 'GET /api/v1/words' do
        summary 'Get word'
      end
      get do
        render_json(:ok, { message: 'Hello world' })
      end

      desc 'POST /api/v1/words' do
        # consumes ['application/x-www-form-urlencoded']
        summary 'Post word'
      end
      params do
        requires :title, type: String, desc: 'Testing', documentation: { param_type: 'body' }
      end
      post do
        word = Word.new(word_params)
        if word.save
          binding.pry
          render_json(:ok, WordSerializer.new(word).as_json)
        else
          error!({ error: word.errors.full_messages }, 422)
        end
      end
    end
  end
end
