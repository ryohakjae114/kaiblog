require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let!(:user) { create(:user) }

  it '投稿一覧できること' do
    expect(page).not_to have_css('.card')
    create_list(:post, 10, user:)
    visit root_path
    expect(page).to have_css('.card', count: 10)
  end

  it '投稿が作成日の降順に並んでいること' do
    create(:post, body: '今日の天気はいい天気', user:)
    create_list(:post, 10, user:)
    visit root_path
    expect(page).to have_css('.pagination', count: 2)
    click_on '2', class: 'page-link', match: :first
    expect(page).to have_content('今日の天気はいい天気')
  end
end
