require_relative "api"

module Zenduty

  class IncidentsApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def get_incidents(body)
      @api._get("/api/incidents/",body)
    end

    def get_incidents_by_number(incident_number)
      @api._get("/api/incidents/#{incident_number}/")
    end

    def get_incident_alerts(incident_number)
      @api._get("/api/incidents/#{incident_number}/alerts/")
    end

    def get_incident_notes(incident_number)
      @api._get("/api/incidents/#{incident_number}/note/")
    end

    def acknowledge_or_resolve_incidents(incident_number,body)
      @api._patch("/api/incidents/#{incident_number}/",body)
    end

    def create_incident(body)
      @api._post("/api/incidents/",body)
    end
  end
end
