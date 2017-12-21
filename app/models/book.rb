class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  belongs_to :publisher

  validates :author, presence: true
  validates :genre, presence: true
  validates :publisher, presence: true
  validates :code, presence: true
  validates :title, presence: true

  default_scope { order(title: :asc) }

  scope :active, -> { where(active: 1) }
  scope :by_title, ->(title) { where("title LIKE ?", "%#{title}%")}
end
