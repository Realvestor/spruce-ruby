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
    attr_accessor :base_url, :spruce_api_key
  end
end
