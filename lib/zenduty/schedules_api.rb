require_relative "api"

module Zenduty

  class SchedulesApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def get_schedules(team_id)
      @api._get("/api/account/teams/#{team_id}/schedules/")
    end

    def create_schedules(team_id,body)
      @api._post("/api/account/teams/#{team_id}/schedules/",body)
    end

    def update_schedules(team_id,schedule_id, body)
      @api._patch("/api/account/teams/#{team_id}/schedules/#{schedule_id}/",body)
    end

    def delete_schedule(team_id,schedule_id)
      @api._delete("/api/account/teams/#{team_id}/schedules/#{schedule_id}/")
    end
  end
end
