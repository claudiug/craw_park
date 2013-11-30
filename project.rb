require 'nokogiri'
require 'open-uri'
class Project
  data = []
  site = 'http://www.park-one.com/standorte/'
  page = Nokogiri::HTML(open(site))
  puts page.title
  page.css('#cc-matrix-1529124884').each do |node|
     node.css('#cc-m-6520934484').each do |s|
       s.css('a').each do |link|
         data.push(link['href'])
       end
     end
  end
  data.delete_if{|m| m.include?('mail')}

  page1 = Nokogiri::HTML(open(URI.encode(data[0])))
  page1.css('#cc-matrix-1528937084').each do |info|
    info.css('.cc-m-hgrid-column').each do |block|
      block.css('#cc-m-6520329884').each do |c|
        puts c.text.delete("\n").split(" ")
      end
    end

  end
end