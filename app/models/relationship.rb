class Relationship < ApplicationRecord
  belongs_to :following, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :followed, uniqueness: { scope: :following }
end
