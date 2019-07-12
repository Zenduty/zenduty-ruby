require_relative "api"

module Zenduty

  class SchedulesApi
    def initialize(access_token)
      @api = APIClient.new(access_token)
    end

    def get_schedules(team_id)
      #Returns the schedules in a particular team, identified by id
      #params str team_id=> unique id of a team
      @api._get("/api/account/teams/#{team_id}/schedules/")
    end

    def create_schedules(team_id,body)
      #Creates a schedule for a team
      #params str team_id=> unique id of team
      #params hash body=> contains the details of the schedule to be created
      #Sample body=>
      #{"name"=>"Name of schedule",
      # "summary"=>"summar of schedule",
      # "time_zone"=>"Asia/Kolkata",
      # "team"=>"d4a777db-5bce-419c-a725-420ebb505c54",
      # "layers"=>[]}
      @api._post("/api/account/teams/#{team_id}/schedules/",body)
    end

    def get_schedule_by_id(team_id,schedule_id)
      #Returns a particular schedule from a team, identifed by id
      #params str team_id=> unique id of a team
      #params schedule_id=> unique id of schedule
      @api._get("/api/account/teams/#{team_id}/schedules/#{schedule_id}/")
    end

    def update_schedules(team_id,schedule_id, body)
      #Updates the schedule details for a given team, identified by id
      #params str team_id=> unique id of a team
      #params str schedul_id=> unique id of schedule
      #params hash body=> contains the updated values of  schedule
      #   'unique_id' and 'team' are required. Other fields are just those which have been changed
      #Sample body=>
      #{"name"=>"Name of schedule",
      # "summary"=>"summar of schedule",
      # "time_zone"=>"Asia/Kamchatka",
      # "team"=>"d4a777db-5bce-419c-a725-420ebb505c54",
      # "unique_id"=>"f9b34bd3-818a-4b98-9d8a-04d8bd501cd0",
      # "layers"=>[]}
      @api._patch("/api/account/teams/#{team_id}/schedules/#{schedule_id}/",body)
    end

    def delete_schedule(team_id,schedule_id)
      #Deletes a schedule from a team
      #params str team_id=>unique id of team
      #params str schedule_id=> unique id of schedule
      @api._delete("/api/account/teams/#{team_id}/schedules/#{schedule_id}/")
    end
  end
end
