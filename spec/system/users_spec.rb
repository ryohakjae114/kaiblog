require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:hakjae) { create(:user, name: 'hakjae', introduction: '僕の名前はリョハッチェでやんす', external_blog_url: 'https://@example.com') }

  it 'ユーザのプロフィール情報を閲覧できること' do
    sign_in hakjae
    create(:post, user: hakjae)
    visit root_path
    within('.card') do
      click_on 'hakjae'
    end
    expect(page).to have_content('hakjae')
    expect(page).to have_content('僕の名前はリョハッチェでやんす')
    expect(page).to have_link('https://@example.com')
  end
end
