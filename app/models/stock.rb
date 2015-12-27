class Stock < ActiveRecord::Base

  def self.new_from_lookup(ticker_symbol)
    puts 'Making new instance'
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    return nil unless looked_up_stock.name

    new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
    new_stock.last_price = new_stock.price
    new_stock
  end

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  # Return closing price if avaiable, else opening price if availabe
  def price
    puts 'Looking for closing price'
    closing_price = StockQuote::Stock.quote(ticker).close
    return "#{closing_price} (Closing)" if closing_price

    puts 'Looking for opening price'
    opening_price = StockQuote::Stock.quote(ticker).open
    puts 'Done opening'
    return "#{opening_price} (Opening)" if opening_price

    'Unavailable'
  end


  has_many :user_stocks
  has_many :users, through: :user_stocks

end
