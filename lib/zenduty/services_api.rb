require_relative "api"

module Zenduty

  class ServicesApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def get_service_for_team(team_id)
      @api._get("/api/account/teams/#{team_id}/services/")
    end

    def add_new_service_in_team(team_id,body)
      @api._post("/api/account/teams/#{team_id}/services/",body)
    end

    def get_services_by_id(team_id,service_id)
      @api._get("/api/account/teams/#{team_id}/services/#{service_id}/")
    end

    def update_service(team_id,service_id,body)
      @api._patch("/api/account/teams/#{team_id}/services/#{service_id}/",body)
    end

    def delete_service_from_team(team_id,service_id)
      @api._delete("/api/account/teams/#{team_id}/services/#{service_id}/")
    end
  end
end
