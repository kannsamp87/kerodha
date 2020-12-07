class StockRemoveCacheWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(*args)
  	Stock.clear_cache
  end
end
