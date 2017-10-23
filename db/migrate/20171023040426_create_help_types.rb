class CreateHelpTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :help_types do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
