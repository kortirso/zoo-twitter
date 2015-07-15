RSpec.describe User, type: :model do
	describe 'User' do
		let(:user) { create :user }

		it 'should be valid' do
			expect(user).to be_valid
		end

		it 'should be invalid when sign up with existed username' do
			expect { create :user, username: user.username }.to raise_error(ActiveRecord::RecordNotUnique)
		end

		it 'should be invalid when sign up with existed email' do
			expect { create :user, email: user.email }.to raise_error(ActiveRecord::RecordInvalid)
		end
	end
end