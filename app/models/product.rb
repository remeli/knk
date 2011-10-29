class Product < ActiveRecord::Base
  
  # associations:
  belongs_to :category
  
  # scopes:
  default_scope order("id DESC")
  scope :published, where(:published => true)
  scope :unpublished, where(:published => false)
  scope :all_products, where(true)
  scope :recent, limit(10)  

  # validates:
  validates :name, :presence => { :message => "Название обязательно" }
  validates :category_id, :presence => { :message => "Рубрика обязательна" }
  
  #paperclip -> #photo
  has_attached_file :photo, :styles => { :thumb => "300x230>", :medium => "680x450>" },
  :url => "/system/:attachment/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"
  validates_attachment_size :photo, :less_than => 6.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  #paperclip -> #attach
  has_attached_file :attach, :url => "/system/:attachment/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"
  
end
