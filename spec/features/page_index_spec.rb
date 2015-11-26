describe 'Index page' do
    let(:user) { create(:user) }
    before do
        login_as(user, scope: :user)
        visit tweets_path
    end

    it 'should have the title Home' do
        expect(page).to have_title('Home')
    end

    describe 'after Exit button click' do
        it 'should logout and redirect to Welcome Page' do
            click_link 'destroy'
            logout(:user)
            expect(page).to have_title('Welcome')
        end
    end
end