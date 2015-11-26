describe 'Followers page' do
    let(:user) { create(:user) }
    before do
        login_as(user, scope: :user)
        visit followers_path(user.username)
    end

    it 'should have the title Followers' do
        expect(page).to have_title('Followers')
    end
end