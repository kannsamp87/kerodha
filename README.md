# README

# To start the server
* cd kerodha/app
* bundle exec foreman start

# Exercises

1. Sample app with simple CRUD with 3-4 models - `Done`
2. API support with Blueprints - `Done`
3. include login utility in sample app - `Done`
4. Incorporate sidekiq utility - `Done`
5. include delayed  jobs - `Done`
6. Elastic Search in sample app(IC2 and above) - `Done`
7. Cache utuility - `Done`
8. Rspec and minitest
9. Sending Email form App - `Done`
10. Use some aws components/ File attachment components s3 etc
11. I18n Support in app - `Done`
12. Security testing (Basics of XSS SQL injection, and run brakeman) - `Done`
13. https://github.com/rubocop-hq/rails-style-guide
14. Code review with mentor

# Kerodha - Stock Market brokerage application (In Progress)
## APIs
* User Details - GET /users/id
* Stock Details - GET /stocks/id
* List Stocks - GET /stocks
* User Stocks - GET /user/id/positions
* List User Watchlist - GET /user/id/watchlists
* Add Watchlist - POST /user/id/add_to_watchlist
* Buy Order - POST /user/id {stock_id, requested_price, quantity}
* Sell Order - POST /user/id {stock_id, requested_price, quantity}
* Modify Order - PATCH /user/id/order/id {quantity, requested_price}
* Cancel Order - PATCH /user/id/order/id {cancelled: true}

## Model
* User
	* email
	* first name
	* last name
	* is_verified
	* deactivated
* Stocks
	* base_price
	* ltp
	* high
	* low
	* open
	* close
	* type - NSE, BSE
	* delisted
* UserWatchlist
	* user_id
	* stock_id
* UserStocks
	* user_id
	* quantity
	* stock_id
	* user_id
	* type - intraday, holding
	* average_price
* UserStocksOrder
	* user_stock_id
	* type  - buy, sell
	* quantity
	* status - pending, completed, cancelled
	* requested_price
	* completed_price
	* request_type - limit, market_price
	* completed_at
	* cancelled_at
