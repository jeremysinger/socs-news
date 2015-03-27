#!/usr/bin/ruby

# get_news.rb
# Jeremy Singer
# 27 Mar 15


require 'mechanize'
require 'rubygems'
require 'twitter'


### News page on website

puts 'Recent News Stories'
puts

mechanize = Mechanize.new
page = mechanize.get('http://www.gla.ac.uk/schools/computing/news/')
page.search('h2').each do |headline|
  puts headline.text.strip
end

puts
puts 'If your news story is missing, please add it at:'
puts 'http://www.gla.ac.uk/0t4/computing/webeditor/'

puts '------------'


### Twitter Feed

puts 'Recent Twitter Stories'
puts

client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "mGUOo7My0nIppSb5QkvTwnpFz"
  config.consumer_secret = File.open('twitter.secret') {|f| f.readline}
end
client.search("glasgowcs", result_type: "recent").take(20).each do |tweet|
  puts tweet.text
end

puts
puts 'Follow us on twitter: @glasgowcs'
puts '------------'
