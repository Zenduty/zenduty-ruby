require_relative "integrations_api"
include Zenduty
token = "8f06122ae8e09059d3a85314fe877881b4d78608"
sample = "a2c6322b-4c1b-4884-8f7a-a7f270de98cb"
obj = IntegrationsApi.new(token)

body={"name":"asdf",
          "summary":"asdf",
  "application":"27c9800c-2856-490d-8119-790be1308dd4"}

response = obj.get_alerts_in_integration(sample,"c7fff4c5-2def-41e8-9120-c63f649a825c","7c46dc78-fdb9-4389-acb1-0b58e2fb1c7d")
print response.body
print response.code
