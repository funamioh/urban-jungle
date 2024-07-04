require "open-uri"
require "nokogiri"
require "json"

module JsonApi
  class Scraper
    def initialize(url)
      @url = url
    end

    def scrape
      begin

      html_file = URI.open(@url).read
      html_doc = Nokogiri::HTML.parse(html_file)
      plants = []

      html_doc.search("h2").each do |element|
        name = element.text.strip

        plants << {
          name: name
        }
      end

      plants.to_json
    rescue OpenURI::HTTPError => e
      { error: "Failed to retrieve data: #{e.message}" }.to_json
    rescue StandardError => e
      { error: "An error occurred: #{e.message}" }.to_json
      end
    end
  end
end

# The following is the code to run scraping
url = "https://www.goodhousekeeping.com/home/gardening/advice/g1285/hard-to-kill-plants/"
scraper = JsonApi::Scraper.new(url)

# output
puts scraper.scrape
