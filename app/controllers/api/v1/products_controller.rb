class Api::V1::ProductsController < ApplicationController

  def index #/api/v1/products
    @products = Product.all
    render( {json: @products, status: :ok} )
  end

end
