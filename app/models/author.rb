class Author < ApplicationRecord

  default_scope { order(name: :asc) }
  scope :active, -> { where(active: 1) }
end
