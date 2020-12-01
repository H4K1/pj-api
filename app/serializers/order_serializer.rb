class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total
  has_one :store
end
