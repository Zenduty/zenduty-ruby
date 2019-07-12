require_relative "api"

module Zenduty
  class EventsApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def create_event(integration_key,body)
      #Creates an incident event on zenduty
      #params str integration_key=> unique key provided for your integration
      #params hash body=> contains the details of the event
      #   'message', 'summary' are required fields of the body
      #   'alert_type' is "info" by default
      #   'suppressed' is false by default
      #   if no entity_id is provided, Zenduty provides one automatically
      # Sample body=>
      #          {'message'=>message,
      #         'summary'=>summary,
      #         'alert_type'=>alert_type,
      #         'supressed'=>supressed}
      @api._post("/api/events/#{integration_key}/",body)
    end
  end
end
