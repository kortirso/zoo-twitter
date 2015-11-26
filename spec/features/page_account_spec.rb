describe 'Account page' do
    let(:user) { create(:user) }
    before do
        login_as(user, scope: :user)
        visit account_path(user.username)
    end

    it 'should have the title Account' do
        expect(page).to have_title('Account')
    end
end