class Scraper
	def self.scrape 
		data = 
			HTTParty.get('http://www.brainyquote.com/quotes/authors/d/dr_seuss.html')
		
		response_body = 
			data.response.body

		doc = Nokogiri::HTML(
			#insert content here
			response_body
			)

		quotes = []
		doc.css('.bqQuoteLink a').each do |link|
			quotes << link.content
			#puts link.content for debugging
		end	
		quotes.sample

	end 

end