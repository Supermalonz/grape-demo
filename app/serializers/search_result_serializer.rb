# frozen_string_literal: true

class SearchResultSerializer < ActiveModel::Serializer
  attributes :id,
             :keyword_id,
             :header,
             :url,
             :is_ads
end
