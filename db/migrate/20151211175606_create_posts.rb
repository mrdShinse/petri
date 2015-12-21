class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string     :title
      t.text     :content, null: false

      t.references :user,    null: false
      t.timestamps
    end

    add_foreign_key :posts, :users
  end
end
