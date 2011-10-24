class ProductsController < ApplicationController
  def index
    @products = Product.published.page(params[:page]).per(15)
    @categories = Category.all
    @title = "Каталог"
  end
  
end