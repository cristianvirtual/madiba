module AuthorHelper
  def show_authors(book)
    book.authors.collect {|a| a.name }.join(', ')
  end
end