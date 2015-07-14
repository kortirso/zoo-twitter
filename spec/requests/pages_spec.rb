describe 'Pages' do

	describe 'Welcome page with auth' do
		it 'should have the title Welcome' do
			visit tweets_path
			expect(page).to have_title('Welcome')
		end
	end
	
end
