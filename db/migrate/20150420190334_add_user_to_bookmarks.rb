class AddUserToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :user_id, :integer
      add_index :bookmarks, :user_id, :integer
  end
end
#not sure about the add_index added when did the migration I should not have
