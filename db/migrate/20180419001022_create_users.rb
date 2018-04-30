class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :displayName, null: false, index: true
      t.string :email, null: false, index: true
      t.string :photoURL, null: false
      t.string :uid, null: false, index: true
      t.string :providerId, null: false

      t.timestamps
    end
  end
end
