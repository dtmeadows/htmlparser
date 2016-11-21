
require 'nokogiri'
require 'pry'

page = Nokogiri::HTML(open("dev.htm"))

tags = page.css(".started")

days= Array.new

tags.each do |tag| 
	days << tag.text.strip
end

binding.pry

