class Product < ApplicationRecord
  has_and_belongs_to_many :stores
  has_and_belongs_to_many :orders
  validates :name, :sku, :type, :price, presence:true
  validates :type, :inclusion => { :in => ["Pizza", "Complement"]}
  validates :sku, uniqueness: true



  self.inheritance_column = "not_sti"
end
