require 'spruce/client'

module Spruce
  class TitleReport < Client
    # Get title report data
    # GET /title_reports/v2/#{order_id}
    #
    # Returns the data generated from the title search report, in conjunction with either a pdf title search report or title commitment document available from the documents endpoint.
    # The response will include legal description, vesting information, APN, and title defect summary.
    #
    # RESPONSE DATA
    #
    # {
    #   "effective_date": "2017-07-21T00:00:00.000Z",
    #   "vesting_info": "Betty Smith, a married woman as her sole and separate property",
    #   "legal_description": "Lots 6, 7, and the South ½ of Lot 3, West 60 feet of South ½ of Lot 4, West 60 feet of Lot 5 and Lot 8, Block 20, OLD SURVEY, Leesville, Vernon Parish, Louisiana...",
    #   "apn": "230-110-023",
    #   "num_of_open_mortgages": 0,
    #   "num_of_bankruptcies": 0,
    #   "num_of_judgements": 1,
    #   "num_of_other_liens": 1,
    #   "requirements": [
    #     {
    #       "schedule": "B1",
    #       "body": "Proof is required to show that the Borrower has not been known by any other name in the 10 years last past. If they have been known another name, all searches must be amended and run against such name and title is subject to returns, if any, on such amended searches.",
    #       "position": 1
    #     }
    #   ],
    #   "exceptions": [
    #     {
    #       "schedule": "B2",
    #       "body": "Defects, liens encumbrances, adverse claims or other matters, if any, created, first appearing in the public records or attaching subsequent to the effective date hereof but prior to the date the proposed insured acquires for value of record the estate or interest or mortgage thereon covered by this Commitment.",
    #       "position": 1
    #     }
    #   ]
    # }
    def self.get_title_report(order_id:, payload:, headers: {})
      request_handler do
        @payload = payload
        @headers = headers
        @method = :get

        "/title_reports/v2/#{order_id}"
      end
    end
  end
end
