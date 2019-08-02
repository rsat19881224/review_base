class ApplicationController < ActionController::Base
	def authenticate_admin_user!
		authenticate_user!
		unless current_user.admin?
			flash[:alert] = "管理者専用の画面です。管理者でログインしてください。"
			redirect_to root_path
		end
	end
end
