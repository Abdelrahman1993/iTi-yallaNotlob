class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :resturant
      t.string :category
      t.text :menu
      t.string :status
      t.timestamps
    end
    add_reference :orders, :user, foreign_key: true
    # then add to the model
  end
end
