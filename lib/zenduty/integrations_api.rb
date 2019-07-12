require_relative "api"

module Zenduty

  class IntegrationsApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def get_integrations_in_service(team_id,service_id)
      #Returns the integrations in a service
      #params str team_id=> unique id of team
      #params str service_id=> unique id of service
      @api._get("/api/account/teams/#{team_id}/services/#{service_id}/integrations/")
    end

    def create_integration(team_id,service_id,body)
      #Creates a new integration for a given service in a team
      #params str team_id=> unique id of team
      #params str service_id=> unique id of service
      #params hash body=> contains the details of the new integration
      # Sample body=>
      #   {"name"=>"asdf",
      #   "summary"=>"asdf",
      #   "application"=>"27c9800c-2856-490d-8119-790be1308dd4"}
      @api._post("/api/account/teams/#{team_id}/services/#{service_id}/integrations/",body)
    end

    def get_integrations_by_id(team_id,service_id,integration_id)
      #Returns an integration belonging to a service in a team, identified by id
      #params str team_id=> unique id of team
      #params str service_id=> unique id of service
      #params str integration_id=> unique id of integration
      @api._get("/api/account/teams/#{team_id}/services/#{service_id}/integrations/#{integration_id}/")
    end

    def get_alerts_in_integration(team_id,service_id,integration_id)
      #Returns alerts in a particular integration
      #params str team_id=> unique id of team
      #params str service_id=> unique id of service
      #params str integration_id=> unique id of integration
      @api._get("/api/account/teams/#{team_id}/services/#{service_id}/integrations/#{integration_id}/alerts/")
    end
  end
end
