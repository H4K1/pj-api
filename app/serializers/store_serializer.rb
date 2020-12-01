class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :email, :phone
  has_many :orders
end
