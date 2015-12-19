class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email           , null: false                  #mail address
      t.string  :email_for_index , null: false                  #email for index
      t.string  :family_name     , null: false
      t.string  :given_name      , null: false
      t.string  :family_name_kana, null: false
      t.string  :given_name_kana , null: false
      t.string  :hashed_password
      t.date    :start_date      , null: false
      t.date    :end_date
      t.boolean :suspended       , null: false, default: false #suspended falg

      t.timestamps
    end
  end
end
