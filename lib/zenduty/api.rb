require 'httparty'
require 'json'
#require_relative "exceptions"
#require_relative "message/message_class"

module Zenduty
  include HTTParty

  class APIClient

    def initialize(access_token)
      @api_url = "https://www.zenduty.com"
      @access_token = access_token
    end

    def _get(endpoint,body={})
      header = {'Content-type'=> "application/json", "Authorization"=>"Token #{@access_token}"}
      HTTParty.get(@api_url+endpoint, body:body.to_json, headers: header )
    end

    def _post(endpoint, body={})
      #print body
      header = {'Content-type'=> "application/json", "Authorization"=>"Token #{@access_token}"}
      HTTParty.post(@api_url+endpoint, body: body.to_json, headers: header)
    end

    def _patch(endpoint, body={})
      header = {'Content-type'=> "application/json", "Authorization"=>"Token #{@access_token}"}
      HTTParty.patch(@api_url+endpoint, body: body.to_json, headers: header)
    end

    def _delete(endpoint, body={})
      header = {"Content-type"=>"application/json","Authorization"=>"Token #{@access_token}"}
      HTTParty.delete(@api_url+endpoint, body:body.to_json, headers:header)
    end
  end
end
