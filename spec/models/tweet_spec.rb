RSpec.describe Tweet, type: :model do
    it { should validate_presence_of :text }
    it { should validate_presence_of :user_id }
    it { should validate_length_of(:text).is_at_most(140) }
    it { should belong_to :user }

    describe 'Tweet' do
        let(:tweet) { create :tweet }

        it 'should be valid' do
            expect(tweet).to be_valid
        end
    end
end