require 'httparty'
require 'json'

def fetch_crypto_data
  response = HTTParty.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')
  if response.success?
    JSON.parse(response.body)
  end 
end

def market_cap_sort(cryptocurrencies)
  cryptocurrencies.sort_by{ |crypto| crypto['market_cap'].to_f }.reverse
end

def display_top_5_cryptocurrencies(cryptocurrencies)
  top_5 = cryptocurrencies.take(5)
  top_5.each do |crypto|
    puts "Names of top 5 : #{crypto['name']}"
    puts "current price: $#{crypto['current_price']}"
    puts "Market Cap: $#{crypto['market_cap']}"
  end 
end


cryptocurrencies = fetch_crypto_data
sorted_cryptocurrencies = market_cap_sort(cryptocurrencies)
display_top_5_cryptocurrencies(sorted_cryptocurrencies)