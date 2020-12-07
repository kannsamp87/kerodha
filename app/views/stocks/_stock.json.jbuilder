json.extract! stock, :id, :name, :identifier, :type, :base_price, :ltp, :high, :low, :open, :close, :delisted, :created_at, :updated_at
json.url stock_url(stock, format: :json)
