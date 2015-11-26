describe 'Following page' do
    let(:user) { create(:user) }
    before do
        login_as(user, scope: :user)
        visit following_path(user.username)
    end

    it 'should have the title Following' do
        expect(page).to have_title('Following')
    end
end