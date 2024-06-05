require "open-uri"
require "nokogiri"

url = "https://www.goodhousekeeping.com/home/gardening/advice/g1285/hard-to-kill-plants/"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML.parse(html_file)

doc.search(".css-prx06t e1bddzxd0").each do |element|
  puts element.text.strip
end
