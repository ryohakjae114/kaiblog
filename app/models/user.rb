class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  validates :introduction, length: { maximum: 200 }
  validates :external_blog_url, length: { maximum: 8000 }

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
