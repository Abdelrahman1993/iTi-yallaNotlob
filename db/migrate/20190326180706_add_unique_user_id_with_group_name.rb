class AddUniqueUserIdWithGroupName < ActiveRecord::Migration[5.2]
  def change
    add_index :groups, [:user_id ,:name], unique: true 
  end
end
