class Api::V1::ProductsController < ApplicationController

  def index #/api/v1/products (fetches all products at once)
    @products = Product.all

    #Order data by title
    @products = Product.order('id').reorder('title')

    #Filter for inventory_count
    @products = @products.inventory_count(params[:inventory_count]) if params[:inventory_count]

    # Search by title
    @products = @products.title(params[:title]) if params[:title]

    render( {json: @products, status: :ok} )
  end

  def show #/api/v1/products/id (fetches 1 product via id ~ id should be replaced by a number)
    @Product = Product.find(params[:id])
    render json: @Product, status: :ok
  end

  #Couldn't get this to work in time for the challenge deadline :( but the idea is there
  def create # POST api/v1/products
    @product = @product.title(params[:title]) if params[:title]
    if @product == nil || @product.inventory_count == 0
      render json: {status: 'Error', message: params[:title] }, status: :unprocessable_entity
    else
      product.decrease_inventory_count
      render json: {status: 'SUCCESS', message: params[:title] }, status: :ok
    end
  end

  private

  #Whitelisting the appropriate attributes
  def product_params
    params.require(:product).permit(:title, :price, :inventory_count, :availability)
  end

end
