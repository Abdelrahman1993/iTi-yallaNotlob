class UpdateForeignKeyOnDeleteConstrainOnUserGroups < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :user_groups, :groups
    add_foreign_key :user_groups, :groups, on_delete: :cascade
  end
end
