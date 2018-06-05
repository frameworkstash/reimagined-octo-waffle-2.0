class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstName, null: false
      t.string :lastName, null: false
      t.string :username, null: false, index: true
      t.string :email, null: false, index: true
      t.string :password_digest, null: false
      t.string :photoURL, null: false
      t.string :headline
      t.string :uid
      t.string :providerId

      t.timestamps
    end
  end
end
