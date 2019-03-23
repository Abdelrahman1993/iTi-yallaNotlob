class UpdateForeignKeyAddOnDeleteConstraintToPart < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :user_order_participations, :orders
    add_foreign_key :user_order_participations, :orders, on_delete: :cascade
  end
end
