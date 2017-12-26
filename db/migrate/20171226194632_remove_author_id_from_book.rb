class RemoveAuthorIdFromBook < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :books, column: :author_id
    remove_index :books, column: :author_id
    remove_column :books, :author_id, :int
  end
end
