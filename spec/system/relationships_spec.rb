require 'rails_helper'

RSpec.describe 'Relationships', type: :system do
  let!(:hakjae) { create(:user, name: 'hakjae') }
  let!(:tajitaku) { create(:user, name: 'tajitaku') }

  context 'ログイン時' do
    before do
      sign_in hakjae
    end

    it 'フォローできること' do
      visit user_path(tajitaku)
      expect do
        click_on 'フォロー'
        expect(page).to have_content('フォローしました')
      end.to change(hakjae.active_relationships, :count).by(1)
      expect(page).to have_button('フォロー解除')
    end

    it 'フォロー解除できること' do
      hakjae.follow!(tajitaku)
      visit user_path(tajitaku)
      expect do
        click_on 'フォロー解除'
        expect(page).to have_content('フォローを解除しました')
      end.to change(hakjae.active_relationships, :count).by(-1)
      expect(page).to have_button('フォロー')
    end
  end
end
