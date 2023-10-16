require "httparty" 
require "nokogiri" 
require "parallel" 

PokemonProduct = Struct.new(:url, :image, :name, :price) 

class Scraper
  USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36" 
  SEMAPHORE = Mutex.new
  CSV_HEADERS = ["url", "image", "name", "price"]
  PAGE_PREFIX = "https://scrapeme.live/shop/page/"

  def initialize
    @pokemon_products = []
    @pages_to_scrape = generate_pages_to_scrape
  end

  def scrape
    Parallel.map(@pages_to_scrape, in_threads: 4) do |page|
      document = get_document(page)
      process_document(document)
    end
    write_to_csv
  end

  private

  def generate_pages_to_scrape
    (2..48).map { |i| "#{PAGE_PREFIX}#{i}/" }
  end

  def get_document(page)
    response = HTTParty.get(page, headers: {"User-Agent" => USER_AGENT})
    Nokogiri::HTML(response.body)
  end

  def process_document(document)
    document.css("li.product").each do |html_product|
      url = html_product.css("a").first.attribute("href").value 
      image = html_product.css("img").first.attribute("src").value 
      name = html_product.css("h2").first.text 
      price = html_product.css("span").first.text 

      pokemon_product = PokemonProduct.new(url, image, name, price) 

      SEMAPHORE.synchronize { 
        @pokemon_products.push(pokemon_product) 
      }
    end
  end

  def write_to_csv
    CSV.open("output.csv", "wb", write_headers: true, headers: CSV_HEADERS) do |csv| 
      @pokemon_products.each do |pokemon_product| 
        csv << pokemon_product 
      end 
    end
  end
end

# use the scraper
scraper = Scraper.new
scraper.scrape