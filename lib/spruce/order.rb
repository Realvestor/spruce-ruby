require 'spruce/client'

module Spruce
  class Order < Client
    # Refinance Transaction Title Order
    #
    # Creates a title order for a new refinance transaction.
    # Returns an order_id and full quote. Depending on client configuration, this will result in the production of a title search report, or full commitment to issue title insurance.
    # The settlement_agent field will additionally contain wiring instructions.
    #
    # REQUEST DATA
    #
    # {
    #   "loan_amount": 580000,
    #   "loan_id": "A4100000",
    #   "estimated_property_value": 725000,
    #   "property_address": {
    #     "street_address": "123 Main St.",
    #     "unit": "Ste. 001",
    #     "city": "Anywhere",
    #     "state": "NY",
    #     "zip_code": "10004"
    #   },
    #   "borrowers": [
    #     {
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     }
    #   ],
    #   "num_of_units": 1
    # }
    #
    # RESPONSE DATA
    #
    # {
    #   "id": "43bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #   "file_number": "114350000004",
    #   "order_status": "new",
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
    #     },
    #     "wiring_instructions": {
    #       "account_number": "1234567890",
    #       "routing_number": "0110000010",
    #       "obi": "114350000000"
    #     }
    #   },
    #   "borrowers": [
    #     {
    #       "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     }
    #   ]
    # }
    def self.refinance_order(payload:, headers: {})
      request_handler do
        @payload = payload
        @headers = headers
        @method = :post

        "/quotes/v4/refinance"
      end
    end

    # Create a purchase mortgage transaction title order
    #
    # Creates a title order for a new purchase mortgage transaction.
    # Returns an order_id and full quote. This will result in the production of a full commitment to issue title insurance.
    # The settlement_agent field will additionally contain wiring instructions.
    #
    # REQUEST DATA
    #
    # {
    #   "loan_amount": 580000,
    #   "loan_id": "A4100000",
    #   "purchase_price": 725000,
    #   "property_address": {
    #     "street_address": "123 Main St.",
    #     "unit": "Ste. 001",
    #     "city": "Anywhere",
    #     "state": "NY",
    #     "zip_code": "10004"
    #   },
    #   "borrowers": [
    #     {
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     }
    #   ],
    #   "sellers": [
    #     {
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     }
    #   ],
    #   "buyer_pays_transfer_taxes": "false",
    #   "num_of_units": 1,
    #   "closing_date": "2017-07-21"
    # }
    #
    # RESPONSE DATA
    #
    # {
    #   "id": "43bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #   "file_number": "114350000004",
    #   "order_status": "new",
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
    #     },
    #     "wiring_instructions": {
    #       "account_number": "1234567890",
    #       "routing_number": "0110000010",
    #       "obi": "114350000000"
    #     }
    #   },
    #   "borrowers": [
    #     {
    #       "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     }
    #   ],
    #   "sellers": [
    #     {
    #       "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     }
    #   ]
    # }
    def self.purchase_mortgage_transaction_order(payload:, headers:)
      request_handler do
        @payload = payload
        @headers = headers
        @method = :post

        '/orders/v4/purchase'
      end
    end

    # Create a cash purchase transaction title order
    # POST /orders/v4/cash_purchase
    #
    # Creates a title order for a new cash purchase transaction.
    # Returns an order_id and full quote. This will result in the production of a full commitment to issue title insurance.
    # The settlement_agent field will additionally contain wiring instructions.
    #
    # REQUEST DATA
    #
    # {
    #   "loan_id": "A4100000",
    #   "purchase_price": 725000,
    #   "property_address": {
    #     "street_address": "123 Main St.",
    #     "unit": "Ste. 001",
    #     "city": "Anywhere",
    #     "state": "NY",
    #     "zip_code": "10004"
    #   },
    #   "buyers": [
    #     {
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     }
    #   ],
    #   "sellers": [
    #     {
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     }
    #   ],
    #   "buyer_pays_transfer_taxes": "false",
    #   "num_of_units": 1,
    #   "closing_date": "2017-07-21"
    # }
    #
    # RESPONSE DATA
    #
    # {
    #   "id": "43bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #   "file_number": "114350000004",
    #   "order_status": "new",
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
    #     },
    #     "wiring_instructions": {
    #       "account_number": "1234567890",
    #       "routing_number": "0110000010",
    #       "obi": "114350000000"
    #     }
    #   },
    #   "buyers": [
    #     {
    #       "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     }
    #   ],
    #   "sellers": [
    #     {
    #       "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     }
    #   ]
    # }
    def self.cash_purchase_order(payload:, headers:)
      request_handler do
        @payload = payload
        @headers = headers
        @method = :post

        '/orders/v4/cash_purchase'
      end
    end

    # Retrieve order info
    # GET /orders/v4/#{order_id}
    #
    # Use the order_id provided in the create order request to get the current state of the order.
    #
    # SAMPLE RESPONSE
    #
    # {
    #   "id": "43bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #   "file_number": "114350000004",
    #   "order_status": "new",
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
    #     },
    #     "wiring_instructions": {
    #       "account_number": "1234567890",
    #       "routing_number": "0110000010",
    #       "obi": "114350000000"
    #     }
    #   },
    #   "borrowers": [
    #     {
    #       "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     },
    #     {
    #       "id": "52bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "entity_name": "Test Company",
    #       "entity_type": "corporation",
    #       "signatories": [
    #         {
    #           "id": "87bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #           "first_name": "Test FN",
    #           "middle_name": "Test MN",
    #           "last_name": "Test LN"
    #         }
    #       ]
    #     }
    #   ],
    #   "buyers": [
    #     {
    #       "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     },
    #     {
    #       "id": "43bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "entity_name": "Test Company",
    #       "entity_type": "corporation",
    #       "signatories": [
    #         {
    #           "id": "87bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #           "first_name": "Test FN",
    #           "middle_name": "Test MN",
    #           "last_name": "Test LN"
    #         }
    #       ]
    #     }
    #   ],
    #   "sellers": [
    #     {
    #       "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     },
    #     {
    #       "id": "43bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "entity_name": "Test Company",
    #       "entity_type": "corporation",
    #       "signatories": [
    #         {
    #           "id": "87bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #           "first_name": "Test FN",
    #           "middle_name": "Test MN",
    #           "last_name": "Test LN"
    #         }
    #       ]
    #     }
    #   ]
    # }
    def self.get_order(order_id:, payload: {}, headers: {})
      request_handler do
        @payload = payload
        @headers = headers
        @method = :get

        "/orders/v4/#{order_id}"
      end
    end

    # Update a title order
    # PUT /orders/v4/{order_id}
    #
    # Updates the title order for an existing transaction.
    # This will result in the generation of related documents.
    # Currently you can update the loan_id and borrowers (Purchase or Refinance transaction) or buyers (Cash Purchase transaction) or sellers(Cash Purchase & Purchase transaction) associated with the given Order.
    # This endpoint cannot be used to add or remove borrowers or buyers or sellers, only to update existing ones.
    #
    # REQUEST DATA
    #
    # {
    #   "loan_id": "A4100000",
    #   "borrowers": [
    #     {
    #       "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     },
    #     {
    #       "id": "52bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "entity_name": "Test Company",
    #       "entity_type": "corporation",
    #       "signatories": [
    #         {
    #           "id": "87bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #           "first_name": "Test FN",
    #           "middle_name": "Test MN",
    #           "last_name": "Test LN"
    #         }
    #       ]
    #     }
    #   ],
    #   "buyers": [
    #     {
    #       "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     },
    #     {
    #       "id": "43bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "entity_name": "Test Company",
    #       "entity_type": "corporation",
    #       "signatories": [
    #         {
    #           "id": "87bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #           "first_name": "Test FN",
    #           "middle_name": "Test MN",
    #           "last_name": "Test LN"
    #         }
    #       ]
    #     }
    #   ],
    #   "sellers": [
    #     {
    #       "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     },
    #     {
    #       "id": "43bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "entity_name": "Test Company",
    #       "entity_type": "corporation",
    #       "signatories": [
    #         {
    #           "id": "87bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #           "first_name": "Test FN",
    #           "middle_name": "Test MN",
    #           "last_name": "Test LN"
    #         }
    #       ]
    #     }
    #   ]
    # }
    #
    # RESPONSE DATA
    #
    # {
    #   "id": "43bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #   "file_number": "114350000004",
    #   "order_status": "new",
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
    #     },
    #     "wiring_instructions": {
    #       "account_number": "1234567890",
    #       "routing_number": "0110000010",
    #       "obi": "114350000000"
    #     }
    #   },
    #   "borrowers": [
    #     {
    #       "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     },
    #     {
    #       "id": "52bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "entity_name": "Test Company",
    #       "entity_type": "corporation",
    #       "signatories": [
    #         {
    #           "id": "87bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #           "first_name": "Test FN",
    #           "middle_name": "Test MN",
    #           "last_name": "Test LN"
    #         }
    #       ]
    #     }
    #   ],
    #   "buyers": [
    #     {
    #       "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     },
    #     {
    #       "id": "43bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "entity_name": "Test Company",
    #       "entity_type": "corporation",
    #       "signatories": [
    #         {
    #           "id": "87bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #           "first_name": "Test FN",
    #           "middle_name": "Test MN",
    #           "last_name": "Test LN"
    #         }
    #       ]
    #     }
    #   ],
    #   "sellers": [
    #     {
    #       "id": "22bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "first_name": "Anne",
    #       "middle_name": "Jimmy",
    #       "last_name": "Carlisle",
    #       "email": "annejcarlisle@example.com",
    #       "phone_number": "10000000000",
    #       "marital_status": "married",
    #       "ssn": "0004"
    #     },
    #     {
    #       "id": "43bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #       "entity_name": "Test Company",
    #       "entity_type": "corporation",
    #       "signatories": [
    #         {
    #           "id": "87bc939f-c5a2-4939-a31a-d0a5fc4f3961",
    #           "first_name": "Test FN",
    #           "middle_name": "Test MN",
    #           "last_name": "Test LN"
    #         }
    #       ]
    #     }
    #   ]
    # }
    def self.update_order(order_id:, payload:, headers: {})
      request_handler do
        @payload = payload
        @headers = headers
        @method = :get

        "/orders/v4/#{order_id}"
      end
    end
  end
end
