RSpec.describe Tweet, type: :model do
	describe 'Tweet' do
		let(:tweet) { create :tweet }

		it 'should be valid' do
			expect(tweet).to be_valid
		end
	end
end