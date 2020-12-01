class Order < ApplicationRecord
  belongs_to :store
  has_and_belongs_to_many :products
  validates :store_id, :product_ids, :total, presence:true
end
