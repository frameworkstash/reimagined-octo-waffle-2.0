class AddSlugToTutorials < ActiveRecord::Migration[5.1]
  def change
    add_column :tutorials, :slug, :string
    add_index :tutorials, :slug
  end
end
