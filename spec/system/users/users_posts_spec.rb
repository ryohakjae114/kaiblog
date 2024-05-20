require 'rails_helper'

RSpec.describe 'Users::Posts', type: :system do
  let!(:user) { create(:user) }
  let(:post) { create(:post, body: '昨日の天気はいい天気だわ', user:) }

  context 'ログイン時' do
    before do
      sign_in user
    end

    it '新規投稿できること' do
      visit root_path
      click_on '新規投稿作成'
      fill_in '本文', with: '今日の天気はいい天気だわ'
      expect do
        click_on '登録する'
        expect(page).to have_content('新規登録しました')
        expect(page).to have_content('今日の天気はいい天気だわ')
      end.to change(user.posts, :count).by(1)
    end

    it '投稿を編集できること' do
      create(:post, body: '昨日の天気はいい天気だわ', user:)
      visit root_path
      click_on '編集'
      fill_in '本文', with: '今日の天気はいい天気だわ'
      click_on '更新する'
      expect(page).to have_content('更新しました')
      expect(page).to have_content('今日の天気はいい天気だわ')
    end

    it '投稿を削除できること' do
      visit edit_post_path(post)
      click_on '削除'
      expect(page).to have_content('削除しました')
      expect(page).not_to have_content('昨日の天気はいい天気だわ')
    end
  end
end
