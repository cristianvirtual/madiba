class AuthorGroup < ApplicationRecord
  self.table_name = 'authors_books'

  belongs_to :book, foreign_key: 'author_id'
  belongs_to :author
end
