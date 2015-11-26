RSpec.describe User, type: :model do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }

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

        describe 'can follow for other user' do
            let(:other_user) { create :user }

            it 'click Follow_button should increase relationships by 1' do
                expect { user.follow!(other_user) }.to change(Relationship, :count).by(1)
            end

            it 'click Unfollow_button should decrease relationships by 1' do
                user.follow!(other_user)
                expect { user.unfollow!(other_user) }.to change(Relationship, :count).by(-1)
            end
        end
    end
end