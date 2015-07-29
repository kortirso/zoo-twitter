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

	describe 'GET #following' do
		it 'redirect to root when user not login' do
			get :following, username: 'sometext'
			expect(response).to render_template :welcome
		end
		it 'redirect to 404 when "person with following" not exist but user login' do
			@current_user = create(:user)
			sign_in @current_user
			get :following, username: ''
			expect(response.status).to eq 404
		end
		it 'redirect to following of "person with following" when user login' do
			@current_user = create(:user)
			sign_in @current_user
			get :following, username: @current_user.username
			expect(response).to render_template :following
		end
	end

	describe 'GET #followers' do
		it 'redirect to root when user not login' do
			get :followers, username: 'sometext'
			expect(response).to render_template :welcome
		end
		it 'redirect to 404 when "person with followers" not exist but user login' do
			@current_user = create(:user)
			sign_in @current_user
			get :followers, username: ''
			expect(response.status).to eq 404
		end
		it 'redirect to followers of "person with followers" when user login' do
			@current_user = create(:user)
			sign_in @current_user
			get :followers, username: @current_user.username
			expect(response).to render_template :followers
		end
	end

	describe 'GET #locale' do
		it 'redirect to root' do
			session[:url] = request.original_url
			get :locale, name: 'ru'
			expect(response).to redirect_to session[:url]
		end
	end

end
