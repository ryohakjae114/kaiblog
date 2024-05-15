class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 },
                   format: { with: /^[0-9a-zA-Z]+$/, message: I18n.t('activerecord.errors.user.name_format_error'), multiline: true }, uniqueness: true
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
