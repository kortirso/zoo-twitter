class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	before_filter :set_locale
	protect_from_forgery with: :exception

	rescue_from ActionController::RoutingError, with: :render_not_found

	def catch_404
		raise ActionController::RoutingError.new(params[:path])
	end

	private
		def render_not_found
			render template: "layouts/403", status: 404
		end

		def set_locale
			I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
		end
end
