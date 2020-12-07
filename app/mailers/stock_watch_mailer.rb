class StockWatchMailer < ApplicationMailer
	def new_stock_watch_email(stock)
	    @order = stock

	    mail(to: "kann87@gmail.com", subject: "Your new watch list!")
	end
end
