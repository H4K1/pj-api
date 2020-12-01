class Product < ApplicationRecord
  validates :name, :sku, :type, :price, presence:true
  validates :type, :inclusion => { :in => ["Pizza", "Complement"]}
  validates :sku, uniqueness: true

  has_and_belongs_to_many :stores


  self.inheritance_column = "not_sti"
end
