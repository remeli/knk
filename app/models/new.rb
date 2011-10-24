class New < ActiveRecord::Base
  
  # scopes
  
  default_scope order("created_at DESC")
  scope :recent, limit(5)
  #validates
  
  validates :title, :presence => { :message => "Название обязательно" }
  validates :title, :length => {:maximum => 250}
  validates :body, :presence => { :message => "Текст обязателен" }
end