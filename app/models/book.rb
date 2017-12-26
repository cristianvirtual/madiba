class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  belongs_to :genre
  belongs_to :publisher
  has_many :trips

  validates :genre, presence: true
  validates :publisher, presence: true
  validates :code, presence: true
  validates :title, presence: true

  default_scope { order(title: :asc) }

  has_attached_file :cover, styles: {
      medium: '>150x150',
      small: '90x90>',
      thumb: '25x40>'
  },
                    default_url: '/images/books/:style/default.png'
  validates_attachment_content_type :cover, content_type: ["image/jpeg", "image/gif", "image/png"]

  scope :active, -> { where(active: 1) }
  scope :by_title, ->(title) { where("title LIKE ?", "%#{title}%")}
end
