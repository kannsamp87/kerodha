require 'elasticsearch/model'

class Stock < ApplicationRecord
	 include ActiveModel::Validations

	include Elasticsearch::Model
  	include Elasticsearch::Model::Callbacks

  	settings do
	    mappings dynamic: false do
	      indexes :name, type: :text, analyzer: :english
	      indexes :identifier, type: :text, analyzer: :english
	      indexes :type, type: :text, analyzer: :english
	      indexes :delisted, type: :boolean
	    end
  	end

	has_and_belongs_to_many :users, uniq: true
	# belongs_to :user
	has_many :watchlists
	has_many :watchers, through: :watchlists

	after_commit :clear_cache
	
	scope :nse, -> { where(type: 'NSE', archived: false) } 	
	scope :bse, -> { where(type: 'BSE', archived: false) } 

	delegate :nse, :bse, to: :stocks
	validates :name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
	validates :identifier, presence: true, length: { in: 3..12 }
	validates :type, presence: true, inclusion: { in: %w(NSE BSE), message: "%{value} is not a valid size" }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
	validates :ltp, numericality: { only_integer: true, greater_than: 0 }
	validates :base_price, numericality: { only_integer: true, greater_than: 0 }

	def self.cache_stocks
	    self.all.each do |stock|
	      $redis.hset("stocksnew", "#{stock.id}", "#{stock.name}")
	    end
  	end

	def clear_cache
	    $redis.hkeys("stocksnew").each do |key|
	    	$redis.hdel("stocksnew",key)
	    end
	    StockAddCacheWorker.perform_async
  	end

  	def as_indexed_json(options = {})
	    self.as_json(
	      only: [:id, :name, :identifier, :type, :base_price, :ltp, :delisted]
	    )
  	end  

  	def to_s
  		puts "#{self.id}, #{self.name}, #{self.ltp}, #{self.identifier}, #{self.type}"
  	end

  	def self.search_published(query)
	  self.search({
	    query: {
	      bool: {
	        must: [
	        {
	          multi_match: {
	            query: query,
	            fields: [:name, :identifier, :ltp, :type]
	          }
	        },
	        {
	          match: {
	            delisted: false
	          }
	        }]
	      }
	    }
	  })
	end
end
