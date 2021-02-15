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
#         binding.pry
#     end


#   end 