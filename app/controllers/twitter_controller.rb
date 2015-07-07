class TwitterController < ApplicationController

	def index
		if current_user
			render template:"twitter/index"
		else
			render template:"twitter/welcome"
		end
	end

	def account

	end

end
