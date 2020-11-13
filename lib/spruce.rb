require 'spruce/error'
require 'spruce/version'

require 'spruce/client'

require 'spruce/closing'
require 'spruce/document'
require 'spruce/order'
require 'spruce/quote'
require 'spruce/settlement_statement'
require 'spruce/title_report'

module Spruce
  class << self
    attr_accessor :spruce_base_url,
                  :spruce_api_key,
                  :spruce_environment,
                  :lender_id
  end
end
