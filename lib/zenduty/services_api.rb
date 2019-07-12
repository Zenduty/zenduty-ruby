require_relative "api"

module Zenduty

  class ServicesApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def get_service_for_team(team_id)
      #Returns all the services in a team
      #params str team_id=> unnique id of team
      @api._get("/api/account/teams/#{team_id}/services/")
    end

    def add_new_service_in_team(team_id,body)
      #Adds a new servie to a give team, identified by id
      #params str team_id=> unique id of team
      #params hash body=> contains the details of the new service to be added
      #Sample body
      #{"name"=>"Name of service",
      # "description"=>"Description of service",
      # "integrations"=>[{"application"=>"27c9800c-2856-490d-8119-790be1308dd4",
      #                 "name"=>"API",
      #                 "summary"=>"Edit summary for this integration"}],
      # "escalation_policy"=>"5c9b6288-c105-418d-970b-91a93d0e919a",
      # "acknowledgement_timeout"=>1,
      # "auto_resolve_timeout"=>1}
      @api._post("/api/account/teams/#{team_id}/services/",body)
    end

    def get_services_by_id(team_id,service_id)
      #Returns a particular service from a  team, identified by id
      #params str team_id=> unique id of team
      #params str service_id=> unique id of service
      @api._get("/api/account/teams/#{team_id}/services/#{service_id}/")
    end

    def update_service(team_id,service_id,body)
      #Updates the existing service in a team
      #params str team_id=> unique id of team
      #params str service_id=> unique id of service
      #params hash body=> contains the updated details of services
      #Sample body=>
      #{"unique_id"=>"bc808ce3-46c0-41d0-bf1f-f405fdd0c1c3",
      # "auto_resolve_timeout"=>0,
      # "acknowledgement_timeout"=>0,
      # "status"=>1,
      # "escalation_policy"=>"5c9b6288-c105-418d-970b-91a93d0e919a"}
      @api._patch("/api/account/teams/#{team_id}/services/#{service_id}/",body)
    end

    def delete_service_from_team(team_id,service_id)
      #Deletes a particular service from a team
      #params str team_id=> unique id of team
      #params str service_id=> unnique id of service
      @api._delete("/api/account/teams/#{team_id}/services/#{service_id}/")
    end
  end
end
