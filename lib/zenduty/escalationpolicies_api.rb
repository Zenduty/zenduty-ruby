require_relative "api"

module Zenduty

  class EscalationPoliciesApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def get_escalation_policies(team_id)
      #Returns the escalation policies belonging to one team
      #params str team_id=> unique id of team
      @api._get("/api/account/teams/#{team_id}/escalation_policies/")
    end

    def create_escalation_policy(team_id,body)
      #Creates an escalation policy for one team
      #params str team_id=> unique id of team
      #params hash body=> contains the required details for creating escalation policy
      #Sample body=>
      #   {'name'=>name,
      #     'summary'=>summary,
      #     'description'=>description,
      #     'rules'=>rules,
      #     'unique_id'=>unique_id,
      #     'team'=>team_id}
      @api._post("/api/account/teams/#{team_id}/escalation_policies/",body)
    end

    def get_escalation_policy_by_id(team_id,ep_id)
      #Returns escalation_policy identified by id
      #params str team_id=> unique id of team
      #params str ep_id=> unique id of escalation policy
      @api._get("/api/account/teams/#{team_id}/escalation_policies/#{ep_id}/")
    end

    def update_escalation_policy(team_id,ep_id,body)
      #Updates escalation policy, identified by id
      #params str team_id=> unique id of team
      #params str ep_id=> unqiue id of escalation policy
      #params hash body=> contains all the updated values
      #       'rules' is a required part of the body
      #Sample body=>
      # body={'summary'=>'changes description',
      #       'rules'=>[{"delay"=>1,
      #                 "targets"=>[{"target_type"=>2,
      #                             "target_id"+."826032d6-7ccd-4d58-b114-f"}],
      #                 "position"=>1,
      #                 "unique_id"=>"c0dad09b-321b-491e-9c23-f816c7bd0339"}]}
      @api._patch("/api/account/teams/#{team_id}/escalation_policies/#{ep_id}/",body)
    end

    def delete_escalation_policy(team_id,ep_id)
      #Deletes escalation policy, identified by id
      #params str team_id=> unique id of team
      #params str ep_id=> unique id of escalation policy
      @api._delete("/api/account/teams/#{team_id}/escalation_policies/#{ep_id}/")
    end
  end
end
