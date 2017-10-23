class CreateLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :levels do |t|
      t.string :skill_level, null: false

      t.timestamps
    end
  end
end
