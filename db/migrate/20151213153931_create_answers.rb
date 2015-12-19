class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :post,    null: false
      t.string     :content, null: false

      t.references :user,    null: false
      t.timestamps
    end

    add_foreign_key :answers, :posts
    add_foreign_key :answers, :users
  end
end
