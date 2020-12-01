class Store < ApplicationRecord
  validates :name, :address, :phone, :product_ids, presence:true
  has_many :orders, dependent: :delete_all
  has_and_belongs_to_many :products, dependent: :delete_all

end
