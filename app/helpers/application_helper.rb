module ApplicationHelper
  
  def data_company
    {
      :name => %q{ТОО "КНК ЭЛЕКТРО"},
      :phone_code => "+7(7142)",
      :phone => "57 94 89",
      :email => "knk-electro@yandex.kz",
      :description_company => "Электротехническая продукция",
      :year_copy => Time.now.year,
      # seo:
      :meta_desc => "Электротехническая продукция. Костанай. Казахстан. Оптово-розничная торговля электротехнической продукции лучших производителей России,Китая и СНГ",
      :meta_keywords => "кабель, провод, автоматы, лампочка, лампа, светильник, трансформатор, шкаф, щрп, щрв, вру, рубильник, счетчик, розетка, обогреватель, тепловая завеса, энергосберегающее, светодиодное, фонарь, кабель канал, инструмент, стабилизатор, стремянка, ДРЛ, ДРВ, металлогалоген"
    }
  end
  
  def title
    @base_title = data_company[:name]
    if @title
      @base_title + " / " + @title
    else
      @base_title
    end
  end
  
  def date(object)
    object.created_at.to_date
  end
  
  def news_more(object, length=500)
    raw(truncate(object.body, :length => length))
  end
  
  def title_more(object)
    raw(truncate(object.title, :length => 35))
  end
  
  def flash_message(object)
    render(:partial => "shared/notice", :locals => { :notice => object })
  end
  
  def find_all_subcategories(category)
    if category.children.size > 0
      ret = "<ul>"
      category.children.each { |subcat|
        if subcat.children.size > 0
          ret += "<li>"
          ret += link_to subcat.name, subcat
          ret += find_all_subcategories(subcat)
          ret += "</li>"
        else
          ret += "<li>"
          ret += link_to subcat.name, subcat
          ret += "</li>"
        end
      }
      ret += "</ul>" 
    end
  end  
  
  def photo_product(object)
    if object.photo.size.to_i > 0
      image_tag('/assets/camera.png')
    end
    
  end
end
