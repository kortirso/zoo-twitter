RSpec.describe TwitterController, type: :controller do

	describe 'GET #index' do
		it 'redirect to root when user not login' do
			get :index
			expect(response).to render_template :welcome
		end
		it 'redirect to wall when user correctly login' do
			@current_user = create(:user)
			sign_in @current_user
			get :index
			expect(response).to render_template :index
		end
	end

	describe 'GET #account' do
		it 'redirect to root when user not login' do
			get :account, username: 'sometext'
			expect(response).to render_template :welcome
		end
		it 'redirect to 404 when "person with tweets" not exist but user login' do
			@current_user = create(:user)
			sign_in @current_user
			get :account, username: ''
			expect(response.status).to eq 404
		end
		it 'redirect to tweets of "person with tweets" when user login' do
			@current_user = create(:user)
			sign_in @current_user
			get :account, username: @current_user.username
			expect(response).to render_template :account
		end
	end

end
