class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :sku, :type, :price
end
