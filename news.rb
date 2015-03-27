#!/usr/bin/ruby

# get_news.rb
# Jeremy Singer
# 27 Mar 15


require 'mechanize'
require 'rubygems'
require 'twitter'

mechanize = Mechanize.new

page = mechanize.get('http://www.gla.ac.uk/schools/computing/news/')


page.search('h2').each do |headline|
  puts headline.text.strip
end


client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "mGUOo7My0nIppSb5QkvTwnpFz"
  config.consumer_secret = File.open('twitter.secret') {|f| f.readline}
end

client.search("glasgowcs", result_type: "recent").take(20).each do |tweet|
  puts tweet.text
end
