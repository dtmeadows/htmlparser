
require 'nokogiri'
require 'pry'
require 'csv'

#declares stuff
$tweets = Array.new

#gets list of html files from working directory

file_list = Array.new 

Dir.glob("*.htm").each do |dir| 
	file_list << dir 
end
p "Grabbed file list..."


#parser function to open html files and return dates 

def html_parser(file)

	page = Nokogiri::HTML(open(file))

	tags = page.css(".started")
	tags.each do |tag| 
		$tweets << {:timestamp => tag.text.strip, :tag => file} 
	end
	p "Successfully parsed #{file}"
	return tags

end

#calls parser for each file 

file_list.each do |file|
	html_parser(file)
end

#writes to csv

CSV.open("test.csv", "wb") do |csv| 
	$tweets.each do |tweet|
		csv << [tweet[:timestamp], File.basename(tweet[:tag],File.extname(tweet[:tag]))] 
	end
	p "Successfully output CSV."
end 
