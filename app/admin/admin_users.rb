ActiveAdmin.register AdminUser do
  menu :label => "Администраторы"
  
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end
  
  form do |f|
    f.inputs "Детали" do
      f.input :email
      f.input :password
    end
    f.buttons
  end
end
