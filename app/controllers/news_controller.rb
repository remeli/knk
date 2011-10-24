class NewsController < ApplicationController

  respond_to :html
  
  def index
    @news = New.page(params[:page]).per(3)
    @title = "Новости"
  end
  
  def show
    begin
      @new = New.find(params[:id])
      @title = "Новости / #{@new.title}"      
    rescue ActiveRecord::RecordNotFound
      redirect_to news_index_path, :alert => "Новость не найдена"
    end
  end
    
end