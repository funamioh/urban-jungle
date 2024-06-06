require "open-uri"
require "nokogiri"

module JsonApi
  class Scraper
    def initialize(url)
      @url = url
    end

    def scrape
      url = "https://www.goodhousekeeping.com/home/gardening/advice/g1285/hard-to-kill-plants/"

      html_file = URI.open(url).read
      html_doc = Nokogiri::HTML.parse(html_file)
      plants = []

      html_doc.search("h2").each do |element|
        name = element.text.strip

        plants << {
          name: name
        }
      end

      plants.to_json
    end
  end
end
