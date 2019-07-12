require_relative "api"

module Zenduty

  class IntegrationsApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def get_integrations_in_service(team_id,service_id)
      @api._get("/api/account/teams/#{team_id}/services/#{service_id}/integrations/")
    end

    def create_integration(team_id,service_id,body)
      @api._post("/api/account/teams/#{team_id}/services/#{service_id}/integrations/",body)
    end

    def get_integrations_by_id(team_id,service_id,integration_id)
      @api._get("/api/account/teams/#{team_id}/services/#{service_id}/integrations/#{integration_id}/")
    end

    def get_alerts_in_integration(team_id,service_id,integration_id)
      @api._get("/api/account/teams/#{team_id}/services/#{service_id}/integrations/#{integration_id}/alerts/")
    end
  end
end
