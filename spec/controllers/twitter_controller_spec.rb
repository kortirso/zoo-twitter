RSpec.describe TwitterController, type: :controller do

	describe "GET #index" do
		it "redirect to root when user not login" do
			get :index
			expect(response).to render_template :welcome
		end
		it "redirect to wall when user correctly login" do
			@current_user = create(:user)
			sign_in @current_user
			get :index
			expect(response).to render_template :index
		end
	end

end
