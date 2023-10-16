require "httparty" 
require "nokogiri"

# downloading the target web page 
response = HTTParty.get("https://scrapeme.live/shop/")
