class Api::V1::ProductsController < ApplicationController

  def index #/api/v1/products (fetches all products at once)
    @products = Product.all

    #Filter for inventory_count
    @products = @products.inventory_count(params[:inventory_count]) if params[:inventory_count]
    
    render( {json: @products, status: :ok} )
  end

  def show #/api/v1/products/id (fetches 1 product via id ~ id should be replaced by a number)
    @Product = Product.find(params[:id])
    render json: @Product, status: :ok
  end

  def create # POST api/v1/products
    @product = Product.create(product_params)
    render json: @product, status: :created
  end

  private

  #Whitelisting the appropriate attributes
  def product_params
    params.require(:product).permit(:title, :price, :inventory_count, :availability)
  end

end
