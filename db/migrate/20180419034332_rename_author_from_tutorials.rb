class RenameAuthorFromTutorials < ActiveRecord::Migration[5.1]
  def change
    rename_column :tutorials, :author, :author_name
  end
end
