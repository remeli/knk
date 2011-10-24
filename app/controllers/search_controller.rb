class SearchController < ApplicationController
  
  def index
    if params[:name].blank?
      redirect_to(products_path, :alert => "Ничего не найдено")
    else
      word = '%'+params[:name]+'%'
      text_conditions = "SELECT * FROM products WHERE (name like ? or manufact like ? or description like ?) AND products.published=true"
      conditions = [text_conditions, word, word, word]
      @products = Product.find_by_sql(conditions)
      unless @products.size > 0
        redirect_to(products_path, :alert => "Ничего не найдено")
      end
    end
  end
  
end
