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
  file = File.open('dump.txt', 'w')
  find_link = Mechanize.new
  ap_links.each do |link|
    new_mechanize = agent.get(link)
    create_links = new_mechanize.search('tr[onclick]').map{|n| n['onclick'][/\/(.*)/]}
    puts create_links
    create_links.each do |url_link|
      make_link = url_link.chop!.chop!
      get_text = find_link.get(BASE_URL + make_link).search('//*[@id="standorte"]').text
      file.puts(get_text)
    end

  end
end
