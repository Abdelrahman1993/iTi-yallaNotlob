class CreateUserOrderParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_order_participations do |t|
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true
      t.string :item
      t.text :comment
      t.float :price
      t.integer :amount

      t.timestamps
    end
  end
end
