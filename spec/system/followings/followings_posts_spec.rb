require 'rails_helper'

RSpec.describe 'Followings::Posts', type: :system do
  let!(:hakjae) { create(:user, name: 'hakjae') }
  let!(:tajitaku) { create(:user, name: 'tajitaku') }
  let!(:micchan) { create(:user, name: 'micchan') }

  context 'ログイン時' do
    before do
      create(:post, user: tajitaku)
      create(:post, user: micchan)

      sign_in hakjae
      hakjae.follow!(tajitaku.id)
    end

    it 'フォロー中のユーザの投稿一覧機能' do
      visit followings_posts_path
      expect(page).to have_content('tajitaku')
      expect(page).not_to have_content('micchan')
    end
  end
end
