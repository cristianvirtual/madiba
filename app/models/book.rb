class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  belongs_to :genre
  belongs_to :publisher
  has_many :trips

  validates :genre, presence: true
  validates :publisher, presence: true
  validates :title, presence: true
  validates :volume, :edition, :pages, numericality: { greater_than: 0 }, allow_blank: true

  before_create :set_code

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


  def self.search(search)
    joins(:genre).joins(:authors).where("title LIKE ? OR isbn LIKE ? OR authors.name LIKE ? OR genres.name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def get_barcode
    barcode = Barby::Code128B.new(code)
    barcode.to_png(:margin => 10, :xdim => 2, :height => 120)
  end

  private

  def set_code
    self.code = SecureRandom.hex(5)
    #barcode = Barby::Code128B.new(code)
  end

end
