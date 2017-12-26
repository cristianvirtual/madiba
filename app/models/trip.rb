class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :from_user, class_name: 'User'
end
