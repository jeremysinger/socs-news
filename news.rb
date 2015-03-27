#!/usr/bin/ruby

# get_news.rb
# Jeremy Singer
# 27 Mar 15


require 'mechanize'

mechanize = Mechanize.new

page = mechanize.get('http://www.gla.ac.uk/schools/computing/news/')


page.search('h2').each do |headline|
  puts headline.text.strip
end

