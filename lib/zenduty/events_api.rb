require_relative "api"

module Zenduty
  class EventsApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def create_event(integration_key,body)
      @api._post("/api/events/#{integration_key}/",body)
    end
  end
end
