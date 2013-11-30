require 'nokogiri'
require 'open-uri'
require 'mechanize'
class Project
  ap_links = []
  site = 'http://www.apcoa.de/parken-in-deutschland.html'
  page = Nokogiri::HTML(open(site))
  BASE_URL = 'http://www.apcoa.de'
  PARIKING_LIST = 'section.parking-list section#standorte'

  page.css('.locations').each do |links|
    links.css('a').each do |address|
      ap_links.push(BASE_URL + address['href'])
    end
  end

  agent = Mechanize.new
  link1 =  agent.get(ap_links[3])
  puts link1.title
  puts link1.links
end
