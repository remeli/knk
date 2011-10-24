ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  section "Последние новости:", :priority => 1 do
    ul do
      New.recent.collect do |new|
        li link_to(new.title, admin_news_path(new))
      end
    end
  end

  section "Последние рубрики:", :priority => 2 do
    ul do
      Category.recent.collect do |category|
        li link_to(category.name, admin_categories_path(category))
      end
    end
  end

  section "Последние товары:", :priority => 3 do
    ul do
      Product.recent.collect do |product|
        li link_to(product.name, admin_products_path(product))
      end
    end
  end
  
  section "Управление сайтом:", :priority => 4 do
     div "Приветствуем! Здесь Вы сможете управлять новостями, каталогом, пользователями"
  end 

  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

end
