# frozen_string_literal: true

module V1
  module Helpers
    module ResponseHelper
      extend Grape::API::Helpers

      class NotFoundPlatformKeyError < StandardError; end

      def render_json(symbol, data = {})
        code = SYMBOL_TO_STATUS_CODE[symbol]
        status code
        error!(symbol) if code >= 400

        present data
      end
    end
  end
end
