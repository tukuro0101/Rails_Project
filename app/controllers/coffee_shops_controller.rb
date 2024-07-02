class CoffeeShopsController < ApplicationController
  before_action :set_coffee_shop, only: %i[ show edit update destroy ]

  # GET /coffee_shops or /coffee_shops.json
  def index
    @rating_filter = params[:rating_filter]
    @keyword = params[:keyword]

    @coffee_shops = CoffeeShop.all

    if @rating_filter.present?
      case @rating_filter
      when "1-2"
        @coffee_shops = @coffee_shops.where(rating: 1.0..2.0)
      when "3-4"
        @coffee_shops = @coffee_shops.where(rating: 3.0..4.0)
      when "4-5"
        @coffee_shops = @coffee_shops.where(rating: 4.0..5.0)
      end
    end

    if @keyword.present?
      @coffee_shops = @coffee_shops.where("name LIKE ?", "%#{@keyword}%")
    end

    @coffee_shops = @coffee_shops.page(params[:page])
  end

  # GET /coffee_shops/1 or /coffee_shops/1.json
  def show
  end

  # GET /coffee_shops/new
  def new
    @coffee_shop = CoffeeShop.new
  end

  # GET /coffee_shops/1/edit
  def edit
  end

  # POST /coffee_shops or /coffee_shops.json
  def create
    @coffee_shop = CoffeeShop.new(coffee_shop_params)

    respond_to do |format|
      if @coffee_shop.save
        format.html { redirect_to coffee_shop_url(@coffee_shop), notice: "Coffee shop was successfully created." }
        format.json { render :show, status: :created, location: @coffee_shop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coffee_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffee_shops/1 or /coffee_shops/1.json
  def update
    respond_to do |format|
      if @coffee_shop.update(coffee_shop_params)
        format.html { redirect_to coffee_shop_url(@coffee_shop), notice: "Coffee shop was successfully updated." }
        format.json { render :show, status: :ok, location: @coffee_shop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coffee_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffee_shops/1 or /coffee_shops/1.json
  def destroy
    @coffee_shop.destroy

    respond_to do |format|
      format.html { redirect_to coffee_shops_url, notice: "Coffee shop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee_shop
      @coffee_shop = CoffeeShop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coffee_shop_params
      params.require(:coffee_shop).permit(:name, :location, :rating, :description)
    end
end
