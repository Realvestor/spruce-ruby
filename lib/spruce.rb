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
    attr_accessor :spruce_api_key,
                  :spruce_environment,
                  :spruce_lender_id,
                  :spruce_base_url
  end
end
