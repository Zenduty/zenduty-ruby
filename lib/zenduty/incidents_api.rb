require_relative "api"

module Zenduty

  class IncidentsApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def get_incidents(body)
      #Returns the incidents from your zenduty account
      #params hash body=> contains all the required details of your account
      # Sample body=>
      #           {'page'=>1,
      #         'status'=>5,
      #         'team_id'=>['a2c6322b-4c1b-4884-8f7a-a7f270de98cb'],
      #         'service_ids'=>[],
      #         'user_ids'=>[]}
      @api._get("/api/incidents/",body)
    end

    def get_incidents_by_number(incident_number)
      #Returns the incidents belonging to a given incident number
      #params int incident_number=> incident number of event
      @api._get("/api/incidents/#{incident_number}/")
    end

    def get_incident_alerts(incident_number)
      #Returns all alerts of a particular incident
      #params int incident_number=> incident number of event
      @api._get("/api/incidents/#{incident_number}/alerts/")
    end

    def get_incident_notes(incident_number)
      #Gets the notes regarding an incident, identified by incident number
      #params int incident_number=> incident number of event
      @api._get("/api/incidents/#{incident_number}/note/")
    end

    def acknowledge_or_resolve_incidents(incident_number,body)
      #Used to acknowledge or resolve incident, identified by incident number
      #params str incident_number=> incident number of event
      #params hash body=> contains the changed values of incident
      # Sample body=>
      #          {'status'=>3,
      #         'incident_number'=>12}
      @api._patch("/api/incidents/#{incident_number}/",body)
    end

    def create_incident(body)
      #Used to create an incident for a particular service, identified by id
      #params hash body=> contains necessary details for creating incident
      # Sample body=>
      #           {"service"=>"c7fff4c5-2def-41e8-9120-c63f649a825c",
      #            "escalation_policy"=>"a70244c8-e343-4dd0-8d87-2f767115568a",
      #            "user"=>null,
      #            "title"=>"Name of trial",
      #            "summary"=>"summary of trial"}
      #  escalation_policy,service, title and summary are required fields.
      #  if escalation_policy is not set (set to None then), then assigned_to is required, as follows
      #           {"service"=>"b1559a26-c51f-45a1-886d-f6caeaf0fc7e",
      #            "escalation_policy"=>null,
      #            "assigned_to"=>"826032d6-7ccd-4d58-b114-f",
      #            "title"=>"Name of trial",
      #            "summary"=>"Summary of trial"}
      @api._post("/api/incidents/",body)
    end
  end
end
