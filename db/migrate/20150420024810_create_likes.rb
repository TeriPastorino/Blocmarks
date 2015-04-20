class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
