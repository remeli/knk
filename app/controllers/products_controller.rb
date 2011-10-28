class ProductsController < ApplicationController
  def index
    @products = Product.published.page(params[:page]).per(30)
    # @categories = Category.all
    @main_categories = Category.mains
    # @child_categories = Category.childrens
    @title = "Каталог"
  end
  
end