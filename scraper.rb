require "httparty" 
require "nokogiri" 
 
PokemonProduct = Struct.new(:url, :image, :name, :price) 
 
pokemon_products = [] 

pages_to_scrape = ["https://scrapeme.live/shop/page/1/"] 
 
pages_discovered = ["https://scrapeme.live/shop/page/1/"] 
 
i = 0 
limit = 5 
 
while pages_to_scrape.length != 0 && i < limit do 
	page_to_scrape = pages_to_scrape.pop 
 
	response = HTTParty.get(page_to_scrape, { 
		headers: { 
			"User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36" 
		}, 
	}) 
 
	document = Nokogiri::HTML(response.body) 
 
	new_pagination_links = document 
							.css("a.page-numbers") 
							.map{ |a| a.attribute("href") } 
 
	new_pagination_links.each do |new_pagination_link| 
		if !(pages_discovered.include? new_pagination_link) && !(pages_to_scrape.include? new_pagination_link) 
			pages_to_scrape.push(new_pagination_link) 
		end 
 
		pages_discovered.push(new_pagination_link) 
	end 
 
	pages_discovered = pages_discovered.to_set.to_a 
 
	i = i + 1 
end 
 

 
csv_headers = ["url", "image", "name", "price"] 
CSV.open("output.csv", "wb", write_headers: true, headers: csv_headers) do |csv| 
	pokemon_products.each do |pokemon_product| 
		csv << pokemon_product 
	end 
end
