require 'yahoo_weatherman'
require 'nokogiri'

puts "What zip code would you like the forecast for?"
zip = gets.chomp.to_s

client = Weatherman::Client.new :unit => 'F' 
 
weather =  client.lookup_by_location(zip.to_s)
 
today = Time.now.strftime('%w').to_i
 
weather.forecasts.each do |forecast|
 
day = forecast['date']
 
weekday = day.strftime('%w').to_i
 
if weekday == today
   dayName = 'Today'
elsif weekday == today + 1
   dayName = 'Tomorrow'
else
   dayName = day.strftime('%A')
end
 
puts dayName + ' is going to be ' + forecast['text'].downcase + ' with a low of ' + forecast['low'].to_s + ' and a high of ' + forecast['high'].to_s
 
end