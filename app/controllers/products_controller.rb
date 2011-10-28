class ProductsController < ApplicationController
  before_filter :load_categories
  def index
    @products = Product.published.page(params[:page]).per(30)
    @title = "Каталог"
  end
  
  def show
    @product = Product.find(params[:id])
    @title = "Каталог / #{@product.name}"
  end
  
  private
  
    def load_categories
      @main_categories = Category.mains
    end
end