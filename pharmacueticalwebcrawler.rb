#Compiled web crawler code that creates CSV's with links and link text 

require 'nokogiri'
require 'open-uri'
require 'csv'
require 'mechanize'


#crawls drugs.com page
page = Nokogiri::HTML(open("https://www.drugs.com/pharmaceutical-companies.html"))
# puts page.class #=> Nokogiri::HTML::Document


pharma_links = page.css("div.col-list-az a")

# Create the CSV and iterate through the links while creating it
# You can also add headers to the CSV on instantiation
CSV.open("/Users/drugs.csv", "wb", write_headers: true, headers: ['description','url']) do |csv| 
  pharma_links.map do |link|
    puts "Adding #{link.text}" # prove that it works :)
    csv << [link.text,link['href']]
  end
end
#----------------------------------------------------------------
#crawls phrma.com
page = Nokogiri::HTML(open("http://www.phrma.org/about/members"))
# puts page.class #=> Nokogiri::HTML::Document


pharma_links = page.css("div#All_Members a")

# Create the CSV and iterate through the links while creating it
# You can also add headers to the CSV on instantiation
CSV.open("/Users/phrma.csv", "wb", write_headers: true, headers: ['description','url']) do |csv| 
  pharma_links.map do |link|
    puts "Adding #{link.text}" # prove that it works :)
    csv << [link.text,link['href']]
  end
end
#----------------------------------------------------------------
#crawls mpr page
alphabetlist = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","x","y","z"]
alphabetlist.each {|i| puts 
agent = Mechanize.new

page = agent.get ("http://www.empr.com/browseby/manufacturers/#{i}")
# puts page.class #=> Nokogiri::HTML::Document


pharma_links = page.css("div.drug-header a")

# Create the CSV and iterate through the links while creating it
# You can also add headers to the CSV on instantiation
CSV.open("/Users/#{i}.csv", "wb", write_headers: true, headers: ['description','url']) do |csv| 
  pharma_links.each do |link|
    puts "Adding #{link.text}" # prove that it works :)
    csv << [link.text,link['href']]
  end
end

}

