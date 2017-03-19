require 'uri'
require 'net/http'
require 'json'

course_uri = URI.encode("https://api.moj.io/v2/trips")
uri = URI.parse(course_uri)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Get.new(uri.request_uri)
request['Authorization'] = 'Bearer ' + "5097e659-5ffd-4da2-af5b-1867bef48de5"

response = http.request(request)

# Get specific header
json_response = JSON.parse(response.body)["Data"]
start_state = json_response[0]
end_state = json_response[json_response.size-1]
fuel_efficiency = start_state["FuelEfficiency"]["BaseValue"]
distance = end_state["EndOdometer"]["Value"]
print start_state
print "\n\n\n"
print end_state
print "\n\n"
print fuel_efficiency
print "\n"
print distance
print "\n"