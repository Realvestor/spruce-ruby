require 'spruce/client'

module Spruce
  class Document < Client
    # Retrieve all the currently downloadable document types for a given order
    # GET /public_documents/v2/#{order_id}/downloadable_document_types
    #
    # RESPONSE DATA
    #
    # [
    #   "PreliminaryClosingDisclosure",
    #   "PreliminarySellerClosingDisclosure",
    #   "SettlementAgentWireInstructions"
    # ]
    def self.downloadable_document_types(payload:, headers: {}, order_id:)
      request_handler do
        @payload = payload
        @headers = headers
        @method = :get

        "/public_documents/v2/#{order_id}/downloadable_document_types"
      end
    end

    # Retrieve the currently available document of the given type
    # GET /public_documents/v2/#{order_id}/#{document_type}
    #
    # RESPONSE DATA
    #
    # N/A
    def self.get_document_types(payload:, headers: {}, order_id:, document_type:)
      request_handler do
        @payload = payload
        @headers = headers
        @method = :get

        "/public_documents/v2/#{order_id}/#{document_type}"
      end
    end

    # Upload a document
    # POST /public_documents/v2/#{order_id}/#{document_type}
    #
    # Upload a Base64-encoded file of the given document_type to Spruce.
    # The list of document_types you can upload is available by calling the /uploadable_document_types endpoint.
    # There is a 200MB maximum file size.
    #
    # REQUEST DATA
    #
    # order_id - order_id provided in the create order request
    # document_type - document_type as retrieved from the /document_types endpoint
    #
    # RESPONSE DATA
    #
    # {
    #   "file": "/9j/4AAQSkZJRgABAgAAAQABAAD/7QCcUGhvdG9zaG9wIDMuMAA4QklNBAQAAAAAAIAcAmcAFFdOclF6UlhCbEd1a..."
    # }
    def self.upload_document(order_id:, document_type:, payload:, headers: {})
      request_handler do
        @payload = payload
        @headers = headers
        @method = :post

        "/public_documents/v2/#{order_id}/#{document_type}"
      end
    end

    # Retrieve all the document types that can be uploaded
    # GET /public_documents/v2/#{order_id}/uploadable_document_types
    #
    # RESPONSE DATA
    #
    # [
    #   "PreliminaryClosingDisclosure",
    #   "PreliminarySellerClosingDisclosure",
    #   "SettlementAgentWireInstructions"
    # ]
    def self.uploadable_document_types(payload:, headers: {}, order_id:)
      request_handler do
        @payload = payload
        @headers = headers
        @method = :get

        "/public_documents/v2/#{order_id}/uploadable_document_types"
      end
    end
  end
end
