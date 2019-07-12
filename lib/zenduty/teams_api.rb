require_relative "api"

module Zenduty

  class TeamsApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def get_teams()
      #Returns all the teams and their details from your Zenduty account
      @api._get("/api/account/teams/")
    end

    def create_team(body)
      #Creates a new team for your zenduty account
      #params hash bodyhash contains the details for your new team
      #Sample bodyhash
      #   'name' is a required field
      #   {'name'=>name}
      @api._post("/api/account/teams/",body)
    end

    def get_team_details(team_id)
      #Returns a team form your zenduty acocunt, identified by id
      # params str team_idhash unique id of team
      @api._get("/api/account/teams/#{team_id}/")
    end

    def delete_team(team_id)
      #Deletes a team form your zenduty account
      #params str team_idhash unique id of team
      @api._delete("/api/account/teams/#{team_id}/")
    end
  end
end
