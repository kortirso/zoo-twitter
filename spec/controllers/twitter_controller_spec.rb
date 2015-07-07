RSpec.describe TwitterController, type: :controller do

	describe "GET #index" do
		it "returns http success" do
			get :index
			expect(response).to have_http_status(:success)
		end
	end

	describe "GET #account" do
		it "returns http success" do
			get :account
			expect(response).to have_http_status(:success)
		end
	end

end
