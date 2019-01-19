class ProductsController < ApplicationController

  def index #/products
    @products = Product.all
    render( {json: @products, status: :ok} )
  end

end
