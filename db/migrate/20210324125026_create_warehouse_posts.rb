class CreateWarehousePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouse_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
