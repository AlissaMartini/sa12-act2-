require 'httparty'
require 'json'

def fetch_time(area, location)
  response = HTTParty.get("http://worldtimeapi.org/api/timezone/#{area}/#{location}")
  if response.success?
    JSON.parse(response.body)
  end
end

def display(area, location, datetime)
  format_DT= DateTime.parse(datetime).strftime('%Y-%m-%d %H:%M:%S')
  puts "The current time in #{area}/#{location} is #{format_DT}"
end


area = 'Europe'
location = 'London'
time_data = fetch_time(area, location)
current_datetime = time_data['datetime']
display(area, location, current_datetime)
