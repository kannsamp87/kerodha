class Watchlist < ApplicationRecord
	belongs_to :watcher, :class_name => 'User', :foreign_key => "user_id"
	belongs_to :watched_stocks, :class_name => 'Stock', :foreign_key => "stock_id"
end
