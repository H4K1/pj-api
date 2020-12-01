class Store < ApplicationRecord
  validates :name, :address, :phone, presence:true
  has_and_belongs_to_many :products
end
