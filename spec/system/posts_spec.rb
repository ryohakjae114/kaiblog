require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let!(:user) { create(:user) }

  it '投稿一覧できること' do
    create(:post, body: '今日の天気はいい天気', user:)
    create_list(:post, 10, user:)
    visit root_path
    expect(page).to have_css('.card', count: 10)
    expect(page).to have_css('.pagination', count: 2)
    click_link '2', class: 'page-link', match: :first
    expect(page).to have_content('今日の天気はいい天気')
  end

  context 'ログイン時' do
    before do
      sign_in :user
      visit root_path
    end
  end
end
