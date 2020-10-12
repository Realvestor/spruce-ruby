require 'spruce/client'

# ::Spruce::Closing.submit_scheduling_request(payload: {}, headers: {}, order_id: "1234")
module Spruce
  class Closing < Client
    # Submit a scheduling request for a loan closing
    # POST /closing/v2/#{order_id}/schedule
    #
    # Creates a scheduling request for a closing for a given order_id.
    # If only the closing_date is submitted with the request, the customer will be given the choice of time and location before the appointment is fulfilled.
    # If the closing_time and closing_address are also submitted with the request, the appointment will be fulfilled and the customer notified.
    # This endpoint is only intended to be called once, any subsequent requests will recieve a 409.
    # If you need to make updates to a request please contact the Spruce team.
    #
    #
    # REQUEST DATA
    #
    # {
    #   "closing_date": "2017-07-21",
    #   "closing_time": "3:00 PM",
    #   "closing_address": {
    #     "street_address": "123 Main St.",
    #     "unit": "Ste. 001",
    #     "city": "Anywhere",
    #     "state": "NY",
    #     "zip_code": "10004"
    #   }
    # }
    def self.submit_scheduling_request(payload:, headers: {}, order_id:)
      request_handler do
        @payload = payload
        @headers = headers
        @method = :post

        "/closing/v2/#{order_id}/schedule"
      end
    end

    # Retrieve closing info
    # GET /closing/v2/#{order_id}
    #
    # REQUEST DATA
    #
    # order_id - order_id provided in the create order request
    #
    # {
    #   "closing_date": "2017-07-21",
    #   "closing_time": "3:00 PM",
    #   "closing_address": {
    #     "street_address": "123 Main St.",
    #     "unit": "Ste. 001",
    #     "city": "Anywhere",
    #     "state": "NY",
    #     "zip_code": "10004"
    #   },
    #   "notary": {
    #     "first_name": "Kate",
    #     "last_name": "McKinnon",
    #     "phone": "10000000000",
    #     "email": "kate.mckinnon@example.com"
    #   }
    # }
    def self.get_closing_info(payload:, headers: {}, order_id:)
      request do
        @payload = payload
        @headers = headers
        @method = :get

        "/closing/v2/#{order_id}"
      end
    end
  end
end
