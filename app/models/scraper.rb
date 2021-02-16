# require 'nokogiri'
# require 'open-uri'
# require_relative "../../config/environment"

# class Scraper
#     attr_reader :url

#     def initialize(url = "https://watchville.com")
#         @url = url
#     end

#     def get_page
#         Nokogiri::HTML(URI.open(url))
#     end

#     def make_articles
#         get_page.css("article").each do |row|
#             binding.pry
#             title = row.css("td:nth-child(2) a.cmc-link").text if row.css("td:nth-child(2) a.cmc-link")
#             descriptor = row.css("td:nth-child(2) a.cmc-link").text if row.css("td:nth-child(2) a.cmc-link")
#             # # binding.pry
#         end
#     end
# end
