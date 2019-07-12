require_relative "api"

module Zenduty

  class MembersApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def add_members_to_team(team_id,body)
      @api._post("/api/account/teams/#{team_id}/members/",body)
    end

    def delete_members_from_team(team_id,member_id)
      @api._delete("/api/account/teams/#{team_id}/members/#{member_id}/")
    end
  end
end
