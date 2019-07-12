require_relative "api"

module Zenduty

  class TeamsApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def get_teams()
      @api._get("/api/account/teams/")
    end

    def create_team(body)
      @api._post("/api/account/teams/",body)
    end

    def get_team_details(team_id)
      @api._get("/api/account/teams/#{team_id}/")
    end

    def delete_team(team_id)
      @api._delete("/api/account/teams/#{team_id}/")
    end
  end
end
