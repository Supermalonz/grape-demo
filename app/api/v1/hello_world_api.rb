# frozen_string_literal: true

module V1
  class HelloWorldAPI < Grape::API
    namespace :hello_world do
      desc 'GET /api/v1/hello_world' do
        summary 'Says Hellow World'
      end
      get do
        render_json(:ok, { message: 'Hello world' })
      end
    end
  end
end
