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
  puts data

  page1 = Nokogiri::HTML(open('http://www.park-one.com/standorte/süd-münchen/'))
  page1.each do |node|
    puts node.css('#cc-m-6520329884').text
  end
end