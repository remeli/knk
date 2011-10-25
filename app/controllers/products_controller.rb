class ProductsController < ApplicationController
  def index
    @products = Product.published.page(params[:page]).per(30)
    @categories = Category.all
    @title = "Каталог"
  end
  
end