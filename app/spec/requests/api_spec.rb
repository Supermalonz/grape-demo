# frozen_string_literal: true

require 'spec_helper'

RSpec.describe KeywordsAPI, type: :request do

describe KeywordsAPI do
  include Rack::Test::Methods

  def app
    KeywordsAPI
  end

  describe KeywordsAPI do
    describe 'Get /api/v1/keywords/all' do
      it 'Get all result' do
        get "/api/v1/keywords/all"
        # last_response.status.should == 200
        # JSON.parse(last_response.body)["hello"].should == "world"
        expect(response.status).to eq(200)
      end
    end

    describe 'Get /api/v1/keywords/all' do
      it 'Get ads result' do
        get "/api/v1/keywords/ads"
        # last_response.status.should == 200
        # JSON.parse(last_response.body)["hello"].should == "world"
        expect(response.status).to eq(200)
      end
    end

    # describe 'Post /api/v1/keywords/csv' do
    #   it 'Get CSV from user and scrape from google' do
    #   end
    # end

    # describe 'GET /api/v1/gengiscan' do
    #   it 'returns a 404 error if no host is provided' do
    #     get "/api/v1/gengiscan"
    #     last_response.status.should == 404
    #   end

    #   it 'run gengiscan over localhost' do
    #     post "/api/v1/gengiscan", "host"=>"localhost"
    #     last_response.status.should == 201
    #     hash = JSON.parse(last_response.body)
    #     hash["status"].should == "OK"
    #   end

    #   it 'run gengiscan over localhost on a port different than 80' do
    #     post "/api/v1/gengiscan", "host"=>"localhost", "port"=>"4000"

    #     last_response.status.should == 201
    #     hash = JSON.parse(last_response.body)
    #     hash["status"].should == "OK"
    #   end
    # end
  end
end
end
