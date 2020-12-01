class CreateJoinTableStoreOrder < ActiveRecord::Migration[5.2]
  def change
    create_join_table :stores, :orders do |t|
      t.index [:store_id, :order_id]
      t.index [:order_id, :store_id]
    end
  end
end
