class Author < ApplicationRecord
  has_many :author_groups, inverse_of: :author
  has_many :books, through: :author_groups

  validates :name, presence: true

  default_scope { order(name: :asc) }
  scope :active, -> { where(active: 1) }

  has_attached_file :photo, styles: {
      medium: '>150x150',
      small: '90x90>',
      thumb: '25x40>'
    },
                    default_url: '/images/authors/:style/default.png'
    validates_attachment_content_type :photo, content_type: ["image/jpeg", "image/gif", "image/png"]
end
