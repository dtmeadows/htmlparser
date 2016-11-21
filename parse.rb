
require 'nokogiri'
require 'pry'

#declares stuff
$tweets = Array.new

#gets list of files 

file_list = Array.new 

Dir.glob("*.htm").each do |dir| 
	file_list << dir 
end


#parser function to open html files and return dates 

def html_parser(file)

	page = Nokogiri::HTML(open(file))


	tags = page.css(".started")
	tags.each do |tag| 
		$tweets << {:timestamp => tag.text.strip, :tag => file} 
	end

	return tags

end

#calls parser for each file 

file_list.each do |file|
	html_parser(file)
end

p $tweets