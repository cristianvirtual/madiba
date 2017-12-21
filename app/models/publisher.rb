class Publisher < ApplicationRecord

  validates :name, presence: true

  default_scope { order(name: :asc) }
  scope :active, -> { where(active: 1) }

end
