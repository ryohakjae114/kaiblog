require 'rails_helper'

RSpec.describe 'Profiles', type: :system do
  let!(:hakjae) { create(:user, introduction: '', external_blog_url: '') }

  context 'ログイン状態' do
    before do
      sign_in hakjae
    end

    it 'プロフィール情報を編集できること' do
      visit root_path
      click_on user.name
      click_on 'プロフィール情報編集'
      fill_in '自己紹介', with: '私の名前はハッチェです。'
      fill_in 'ブログURL', with: 'https://example.com'
      click_on '更新する'
      expect(page).to have_content('更新しました')
      expect(page).to have_field('自己紹介', with: '私の名前はハッチェです。')
      expect(page).to have_field('ブログURL', with: 'https://example.com')
    end
  end
end
