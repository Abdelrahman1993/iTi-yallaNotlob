class UpdateForeignKeyAddOnDeleteConstraint < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :user_order_invitations, :orders
    add_foreign_key :user_order_invitations, :orders, on_delete: :cascade
  end
end
