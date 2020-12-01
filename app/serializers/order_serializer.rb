class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total, :created_at, :updated_at
  has_one :store
  has_many :products
end
