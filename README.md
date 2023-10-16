# Project Name: Data Harvest

## Overview
This Ruby web scraping project is designed to extract data from the website "scrapeme.live." It leverages popular Ruby gems, including HTTParty, Nokogiri, Parallel, and RSpec, to efficiently retrieve and parse information from the target website. Whether you are a seasoned developer or a beginner, this project will provide a useful foundation for web scraping with Ruby.

## Features
1. **Web Scraping:** This project is designed to scrape data from the website [scrapeme.live](https://scrapeme.live/shop/). It can be easily modified to target other websites, making it a versatile tool for data extraction.

2. **HTTParty Integration:** We use the HTTParty gem to make HTTP requests to the target website. This gem simplifies the process of fetching web pages, handling cookies, and managing headers.

3. **Nokogiri Parsing:** The Nokogiri gem is utilized for parsing the HTML content retrieved from the website. It provides an easy way to extract specific data elements from the web page's structure.

4. **Parallel Processing:** The Parallel gem allows for concurrent execution of multiple web scraping tasks, significantly improving the scraping efficiency and speed.

5. **RSpec Testing:** RSpec is used for writing and running tests to ensure that the web scraper performs as expected. This ensures the project's reliability and helps in identifying and fixing issues.

## Installation
Before you can use this web scraper, ensure that you have Ruby installed on your system. You can install the required gems using Bundler:

```bash
gem install bundler
bundle install
```

## Usage
1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/tiagorahal/data-harvest
   ```

2. Navigate to the project directory:

   ```bash
   cd data-harvest
   ```

3. Customize the scraper for your specific needs. You can modify the target website, the data to scrape, and the parsing logic in the `scraper.rb` file.

4. Run the scraper:

   ```bash
   ruby scraper.rb
   ```

   The data will be extracted and displayed in the console or saved to a file, depending on your code modifications.

5. To run the RSpec tests, use the following command:

   ```bash
   rspec scraper_spec.rb
   ```

## Contributing
Contributions to this project are welcome. If you find any issues or have ideas for improvements, please submit a pull request.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Disclaimer
Please ensure that your web scraping activities comply with the website's terms of service and legal regulations in your region. Always be respectful of websites' policies and consider requesting permission before scraping sensitive or private data.
