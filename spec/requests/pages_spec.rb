describe 'Pages' do

	describe 'Welcome page' do
		before { visit tweets_path }

		it 'should have the title Welcome' do
			expect(page).to have_title('Welcome')
		end

		describe 'with invalid login information' do
			it 'should redirect to authorization page' do
				click_button 'authorization'
				expect(page).to have_title('Authorization')
			end
		end

		describe 'with valid login information' do
			let(:user) { create(:user) }
			before do
				within('#login') do
					fill_in 'user_username', with: user.username
					fill_in 'user_password', with: user.password
				end
				click_button 'authorization'
			end
			it 'after login should have the title Home' do
				expect(page).to have_title('Home')
			end
		end

		describe 'with invalid sign up information' do
			it 'should not create a user' do
				expect { click_button 'registration' }.not_to change(User, :count)
			end
			it 'should redirect to registration page' do
				click_button 'registration'
				expect(page).to have_title('Registration')
			end
		end

		describe 'with valid sign up information' do
			before do
				within('#signup') do
					fill_in 'user_username', with: 'Tester'
					fill_in 'user_email', with: 'test@gmail.com'
					fill_in 'user_password', with: 'password'
					fill_in 'user_password_confirmation', with: 'password'
				end
			end

			it 'should create a user' do
				expect { click_button 'registration' }.to change(User, :count).by(1)
			end

			describe 'after saving the user' do
				before { click_button 'registration' }
				let(:user) { User.find_by(email: 'test@gmail.com') }

				it 'shoult have the title Home' do
					expect(page).to have_title('Home')
				end
			end
		end
	end

	describe 'Index page' do
		let(:user) { create(:user) }
		before do
			visit tweets_path
			within('#login') do
				fill_in 'user_username', with: user.username
				fill_in 'user_password', with: user.password
			end
			click_button 'authorization'
			visit tweets_path
		end

		it 'should have the title Home' do
			expect(page).to have_title('Home')
		end
	end

	describe 'Account page' do
		let(:user) { create(:user) }
		before do
			visit tweets_path
			within('#login') do
				fill_in 'user_username', with: user.username
				fill_in 'user_password', with: user.password
			end
			click_button 'authorization'
			visit account_path(user.username)
		end

		it 'should have the title Account' do
			expect(page).to have_title('Account')
		end
	end
end
