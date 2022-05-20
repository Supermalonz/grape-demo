# frozen_string_literal: true

HTTP_STATUS_CODES = Rack::Utils::HTTP_STATUS_CODES
SYMBOL_TO_STATUS_CODE = Rack::Utils::SYMBOL_TO_STATUS_CODE

HTTP_STATUS = HashWithIndifferentAccess.new
SYMBOL_TO_STATUS_CODE.each do |symbol, code|
  HTTP_STATUS[symbol] = {
    message: HTTP_STATUS_CODES[code],
    code: code
  }
end
HTTP_STATUS.freeze
