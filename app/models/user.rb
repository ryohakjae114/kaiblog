class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :following

  validates :name, presence: true, length: { maximum: 20 },
                   format: { with: /^[0-9a-zA-Z]+$/, message: I18n.t('activerecord.errors.user.name_format_error'), multiline: true }, uniqueness: true
  validates :introduction, length: { maximum: 200 }
  validates :external_blog_url, length: { maximum: 8000 }

  def follow?(user)
    active_relationships.exists?(followed_id: user.id)
  end

  def follow!(user_id)
    Relationship.create!(following_id: id, followed_id: user_id)
  end

  # No use email
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
  end
end
