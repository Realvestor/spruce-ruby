# require 'pry'
require 'rest-client'
require 'json'
require 'logger'
require 'jwt'

module Spruce
  class Client
    # Orders can have the following order_status:
    #
    # new - Newly opened order
    # initial_docs_available - The initial documents (PreliminaryClosingDisclosure,SellersClosingDisclosure, and/or SettlementAgentWireInstructions) are available
    # title_report_available - The title search was performed (TitleSearchReport available)
    # signing_scheduled - The closing has been scheduled
    # signing_confirmed - The closing has been confirmed by the notary and signers
    # signing_occurred - The closing happened (ExecutedClientClosingPackage available)
    # waiting_for_funds - Waiting for cash to close (ExecutedBuyerSettlementStatement available)
    # funded - The order has been funded
    # recorded - The required recording documents have been recorded (RecordedDeed available for a purchase, RecordedMortgage available for a refinance)
    # funded_and_recorded - The order has been funded and recorded (does not always happen sequentially due to different state laws).
    # policy_issued - The title policy has been issued (LendersPolicy available)
    # cancelled - The order has been cancelled

    # CALLBACK API
    #
    # We will trigger callbacks for certain events. Right now, we support callbacks on order status changes and updates to some documents.
    # When setting up your API integration you will be asked to provide a callback URL. We will POST to this callback URL whenever an order_status_changed, new_document_available or updated_document_available event occurs.
    # The request bodies for these events will look like:
    #
    # Flow -> quotes, orders, documents, title report, closing, settlement statements
    def self.request_handler
      begin
        if block_given?
          @path = yield
          @api_key = ENV['SPRUCE_API_KEY'] || Spruce.spruce_api_key
          @environment = (ENV['SPRUCE_ENVIRONMENT'] || Spruce.spruce_environment).to_s
          @lender_id = ENV['SPRUCE_LENDER_ID'] || Spruce.spruce_lender_id
          @base_url = ENV['SPRUCE_URL'] || Spruce.base_url
          @url = "#{@base_url}#{@path}"

          @headers = @headers.merge({ 'Authorization': "Bearer #{@api_key}" })

          if @environment.eql?('sandbox')
            @payload.merge!({ "lender_id": @lender_id })
          end

          response = RestClient::Request.execute(
            headers: @headers,
            method: @method,
            payload: @payload.to_json,
            timeout: 10,
            url: @url
          )
          parsed_response = JSON.parse(response.body)
        end
      rescue RestClient::NotFound,
             RestClient::ExceptionWithResponse,
             Errno::EHOSTDOWN => e
        logger ||= Logger.new(STDERR)
        logger.error(e)

        false
      end
    end
  end
end
