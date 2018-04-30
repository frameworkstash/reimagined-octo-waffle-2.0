class AddReferencesToTutorials < ActiveRecord::Migration[5.1]
  def change
    add_reference :tutorials, :hunter, index: true
    add_reference :tutorials, :author, index: true
  end
end
