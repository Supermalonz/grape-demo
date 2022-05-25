# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api/documentation'
  # APIs
  mount ::V1::API => '/api/v1'
  resources :health, only: %i[index]
  resources :violation_reports, only: :create
end
