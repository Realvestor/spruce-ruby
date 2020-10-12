require 'spruce/client'

module Spruce
  class Quote < Client
    # Create a refinance transaction quote
    #
    # POST /quotes/v3/refinance
    #
    # Returns an accurate quote for the applicable title fees, recording fees, and any applicable mortgage taxes, for a proposed refinance or HELOC transaction.
    # Also included in the response is the applicable Settlement Agent information, for use in populating disclosures as necessary.
    #
    # REQUEST DATA
    #
    # {
    # "loan_amount": 580000,
    # "estimated_property_value": 725000,
    # "property_address": {
    # "street_address": "123 Main St.",
    # "unit": "Ste. 001",
    # "city": "Anywhere",
    # "state": "NY",
    # "zip_code": "10004"
    # },
    # "num_of_units": 1
    # }
    #
    # RESPONSE
    #
    # {
    #   "fees": [
    #     {
    #       "type": "title",
    #       "label": "Lender's Policy",
    #       "amount": 1500.75,
    #       "section": "C"
    #     }
    #   ],
    #   "settlement_agent": {
    #     "name": "Spruce Land Services",
    #     "email": "orders@spruce.co",
    #     "phone": "18886657535",
    #     "contact": {
    #       "first_name": "Patrick",
    #       "last_name": "Burns",
    #       "formatted_contact": "Patrick Burns"
    #     },
    #     "address": {
    #       "street_address": "155 W 23rd St",
    #       "unit": "Floor 10",
    #       "city": "New York",
    #       "state": "NY",
    #       "zip_code": "10011",
    #       "formatted_address": "155 W 23rd St, Floor 10, New York, NY 10011"
    #     },
    #     "license_info": {
    #       "state_license_id": "TLA-1234567",
    #       "contact_license_id": "TLA-7654321"
    #     }
    #   }
    # }
    def self.refinance_quote(payload:, headers: {})
      request_handler do
        @payload = payload
        @headers = headers
        @method = :post

        "/quotes/v3/refinance"
      end
    end

    # Create a purchase transaction quote
    #
    # Returns an accurate quote for the applicable title fees, recording fees, and any applicable mortgage taxes, for a proposed purchase mortgage transaction.
    # Also included in the response is the applicable Settlement Agent information, for use in populating disclosures as necessary.
    #
    # REQUEST DATA
    #
    # {
    #   "loan_amount": 580000,
    #   "purchase_price": 725000,
    #   "buyer_pays_transfer_taxes": "false",
    #   "num_of_units": 1,
    #   "property_address": {
    #     "street_address": "123 Main St.",
    #     "unit": "Ste. 001",
    #     "city": "Anywhere",
    #     "state": "NY",
    #     "zip_code": "10004"
    #   }
    # }
    #
    # RESPONSE SAMPLE
    #
    # {
    #   "fees": [
    #     {
    #       "type": "title",
    #       "label": "Lender's Policy",
    #       "amount": 1500.75,
    #       "section": "C"
    #     }
    #   ],
    #   "settlement_agent": {
    #     "name": "Spruce Land Services",
    #     "email": "orders@spruce.co",
    #     "phone": "18886657535",
    #     "contact": {
    #       "first_name": "Patrick",
    #       "last_name": "Burns",
    #       "formatted_contact": "Patrick Burns"
    #     },
    #     "address": {
    #       "street_address": "155 W 23rd St",
    #       "unit": "Floor 10",
    #       "city": "New York",
    #       "state": "NY",
    #       "zip_code": "10011",
    #       "formatted_address": "155 W 23rd St, Floor 10, New York, NY 10011"
    #     },
    #     "license_info": {
    #       "state_license_id": "TLA-1234567",
    #       "contact_license_id": "TLA-7654321"
    #     }
    #   }
    # }
    def self.purchase_quote(payload:, headers: {})
      request_handler do
        @payload = payload
        @headers = headers
        @method = :post

        "/quotes/v3/purchase"
      end
    end
  end
end
