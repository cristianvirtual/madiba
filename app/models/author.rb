class Author < ApplicationRecord
  has_and_belongs_to_many :books

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
