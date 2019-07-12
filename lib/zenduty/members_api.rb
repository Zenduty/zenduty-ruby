require_relative "api"

module Zenduty

  class MembersApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def add_members_to_team(team_id,body)
      #Adds a member to a given team, identified by id
      #params str team_id=> unique id of team
      #params hash body=> contains the details of the user being added and the team to add to
      #Sample body=>
      # {"team"=>"d4a777db-5bce-419c-a725-420ebb505c54","user"=>"af9eeb60-5acb-406c-971e-3"}
      @api._post("/api/account/teams/#{team_id}/members/",body)
    end

    def delete_members_from_team(team_id,member_id)
      #Removes a member from a particular team
      #params str team_id=> unique id of a team
      #params str member_id=> unique id of member to be deleted
      @api._delete("/api/account/teams/#{team_id}/members/#{member_id}/")
    end
  end
end
