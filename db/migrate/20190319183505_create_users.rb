class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :password
      t.string :email
      t.text :pic
      t.text :facebook
      t.text :google

    end
  end
end
