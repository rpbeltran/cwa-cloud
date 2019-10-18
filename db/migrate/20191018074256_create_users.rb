class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :users
    create_table :users do |t|
      t.string :name
      t.string :email_address
      t.string :user_id
      t.string :avatar_url
      t.string :locale
      t.string :given_name
      t.string :last_name

      t.timestamps
    end
  end
end
