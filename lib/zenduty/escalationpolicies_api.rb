require_relative "api"

module Zenduty

  class EscalationPoliciesApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def get_escalation_policies(team_id)
      @api._get("/api/account/teams/#{team_id}/escalation_policies/")
    end

    def create_escalation_policy(team_id,body)
      @api._post("/api/account/teams/#{team_id}/escalation_policies/",body)
    end

    def get_escalation_policy_by_id(team_id,ep_id)
      @api._get("/api/account/teams/#{team_id}/escalation_policies/#{ep_id}/")
    end

    def update_escalation_policy(team_id,ep_id,body)
      @api._patch("/api/account/teams/#{team_id}/escalation_policies/#{ep_id}/",body)
    end

    def delete_escalation_policy(team_id,ep_id)
      @api._delete("/api/account/teams/#{team_id}/escalation_policies/#{ep_id}/")
    end
  end
end
