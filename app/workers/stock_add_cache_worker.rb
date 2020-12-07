class StockAddCacheWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(*args)
  	Stock.cache_stocks
  end
end
