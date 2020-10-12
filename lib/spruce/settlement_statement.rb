require 'spruce/client'

module Spruce
  class SettlementStatement < Client
    # Retrieve settlement statements
    # GET /settlement_statements/v1/#{order_id}
    #
    # Use the order_id provided in the request to get the current settlement statement for the order
    #
    # REQUEST DATA
    #
    # order_id - Spruce order id
    #
    # RESPONSE DATA
    #
    # {
    #   "info": {
    #     "title": "testTitle",
    #     "file_number": "114350000004",
    #     "property_address": {
    #       "street_address": "123 Main St.",
    #       "unit": "Ste. 001",
    #       "city": "Anywhere",
    #       "state": "NY",
    #       "zip_code": "10004"
    #     },
    #     "buyers": [
    #       {
    #         "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #         "first_name": "Anne",
    #         "middle_name": "Jimmy",
    #         "last_name": "Carlisle",
    #         "email": "annejcarlisle@example.com",
    #         "phone_number": "10000000000",
    #         "marital_status": "married",
    #         "ssn": "0004"
    #       },
    #       {
    #         "id": "43bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #         "entity_name": "Test Company",
    #         "entity_type": "corporation",
    #         "signatories": [
    #           {
    #             "id": "87bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #             "first_name": "Test FN",
    #             "middle_name": "Test MN",
    #             "last_name": "Test LN"
    #           }
    #         ]
    #       }
    #     ],
    #     "settlement_agent": {
    #       "name": "Spruce Land Services",
    #       "email": "orders@spruce.co",
    #       "phone": "18886657535",
    #       "contact": {
    #         "first_name": "Patrick",
    #         "last_name": "Burns",
    #         "formatted_contact": "Patrick Burns"
    #       },
    #       "address": {
    #         "street_address": "155 W 23rd St",
    #         "unit": "Floor 10",
    #         "city": "New York",
    #         "state": "NY",
    #         "zip_code": "10011",
    #         "formatted_address": "155 W 23rd St, Floor 10, New York, NY 10011"
    #       },
    #       "license_info": {
    #         "state_license_id": "TLA-1234567",
    #         "contact_license_id": "TLA-7654321"
    #       }
    #     },
    #     "seller": "Jane Doe",
    #     "prepared_for": "Test User",
    #     "closing_date": "2017-07-21",
    #     "funding_date": "2017-08-13T00:00:00.000Z"
    #   },
    #   "transaction_type": "purchase",
    #   "report_type": "buyer",
    #   "sections": [
    #     {
    #       "totals": {
    #         "seller_credit": 10,
    #         "seller_debit": 10,
    #         "buyer_credit": 10,
    #         "buyer_debit": 10
    #       },
    #       "label": "Title Fees",
    #       "section_type": "escrow_title_charges",
    #       "items": [
    #         {
    #           "type": "title_fee",
    #           "label": "Title Fees",
    #           "payment_note": "Paid by seller before closing",
    #           "payment": {
    #             "seller_credit": 10,
    #             "seller_debit": 10,
    #             "buyer_credit": 10,
    #             "buyer_debit": 10
    #           }
    #         }
    #       ]
    #     }
    #   ]
    # }
    def self.settlement_statements(payload:, headers: {}, order_id:)
      request_handler do
        @payload = payload
        @headers = headers
        @method = :get

        "/settlement_statements/v1/#{order_id}"
      end
    end
  end
end
