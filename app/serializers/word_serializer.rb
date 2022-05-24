# frozen_string_literal: true
class WordSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :created_at,
             :updated_at
end