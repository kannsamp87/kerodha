class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    if params["type"] == "NSE"
      @stocks = Stock.where(type: "NSE")
    elsif params["type"] == "BSE"
      @stocks = Stock.where(type: "BSE")
    else
      @stocks = Stock.all
    end
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        temp_params = stock_params
        temp_params["type"] = stock_params["type"] == "NSE" ? "BSE" : "NSE"
        Stock.create(temp_params)
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to_watchlist
    @watch = Watchlist.new(user_id: params[:user_id], stock_id: params[:stock_id])
    if @watch.save
      stock = Stock.find @watch.stock_id
      # Send watchlist mail
      StockWatchMailer.new_stock_watch_email(stock).deliver_later
      respond_to do |format|
        format.html { redirect_to stocks_url, notice: 'Stock was successfully added in the watchlist.' }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    query = params[:search_stocks].presence && params[:search_stocks][:query]

    if query
      @stocks = Stock.search_published(query)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_params
      params.require(:stock).permit(:name, :identifier, :type, :base_price, :ltp, :high, :low, :open, :close, :delisted)
    end
end
