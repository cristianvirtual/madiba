class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :code, null: false
      t.string :isbn
      t.references :author, foreign_key: true
      t.references :genre, foreign_key: true
      t.references :publisher, foreign_key: true
      t.string :title
      t.string :serie_title
      t.integer :volume
      t.integer :edition
      t.integer :publication_year
      t.integer :pages
      t.text :abstract
      t.boolean :active

      t.timestamps
    end
    add_index :books, :isbn
    add_index :books, :code
  end
end
