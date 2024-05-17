require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let!(:user) { create(:user) }

  it '投稿一覧できること' do
    create(:post, body: '今日の天気はいい天気', user:)
    create_list(:post, 10, user:)
    visit root_path
    expect(page).to have_css('.card', count: 10)
    expect(page).to have_css('.pagination', count: 2)
    click_on '2', class: 'page-link', match: :first
    expect(page).to have_content('今日の天気はいい天気')
  end

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
  end
end
