class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :help_type, foreign_key: true

      t.timestamps
    end
  end
end
