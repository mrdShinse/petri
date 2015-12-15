class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :post,    null: false
      t.string     :content, null: false

      t.timestamps
    end

    add_foreign_key :answers, :posts
  end
end
