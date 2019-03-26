class CreateUserOrderInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_order_invitations do |t|
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :seen
      t.timestamps
    end
  end
end
