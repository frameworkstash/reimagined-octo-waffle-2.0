class CreateTutorials < ActiveRecord::Migration[5.1]
  def change
    create_table :tutorials do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :website, null: false
      t.string :author, null: false
      t.references :framework, foreign_key: true
      t.references :level, foreign_key: true

      t.timestamps
    end
  end
end
