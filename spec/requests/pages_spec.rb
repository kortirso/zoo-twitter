describe 'Pages' do

	describe 'Welcome page' do
		before { visit tweets_path }

		it 'should have the title Welcome' do
			expect(page).to have_title('Welcome')
		end

		describe 'with invalid sign up information' do
			it 'should not create a user' do
				expect { click_button 'registration' }.not_to change(User, :count)
			end
		end

		describe 'with valid login information' do
			before do
				within('#login') do
					fill_in 'user_username', with: 'tester'
					fill_in 'user_password', with: 'password'
				end
			end

			describe 'after login of the user' do
				before { click_button 'authorization' }
				#let(:user) { create(:user, username: 'tester') }
				#let(:user) { User.find_by(username: 'tester') }

				it 'shoult have the title Home' do
					#expect(page).to have_title('Home')
				end
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
	
end
