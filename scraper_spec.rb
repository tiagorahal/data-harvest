require 'minitest/autorun'
require_relative 'scraper' # adjust file path as necessary

class TestScraper < Minitest::Test
  def setup
    @scraper = Scraper.new
  end

  def test_pages_to_scrape
    assert_equal 47, @scraper.send(:generate_pages_to_scrape).size
  end

  def test_get_document
    page = 'http://example.com'
    document = @scraper.send(:get_document, page)
    assert_instance_of Nokogiri::HTML::Document, document
  end

  def test_write_to_csv
    @scraper.instance_variable_set(:@pokemon_products, [PokemonProduct.new('url', 'image', 'name', 'price')])
    @scraper.send(:write_to_csv)

    assert File.exist?('output.csv')
  end
end
