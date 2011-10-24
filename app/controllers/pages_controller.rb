class PagesController < ApplicationController
  def index
    @title = "Главная"
    @main_page_news = New.limit(3)    
    render :layout => 'main_page'
  end
  
  def about
    @title = "О компании"
  end

  def contacts
    @title = "Контакты"
  end

end 
