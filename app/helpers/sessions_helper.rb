module SessionsHelper
	def sign_in(user)
	    cookies.permanent[:remember_token] = user.remember_token
	    self.current_user = user
  	end

  	def current_user=(user)
    	@current_user = user
  	end

  	def current_user
    	@current_user ||= User.find_by_remember_token(cookies[:remember_token])    # Useless! Don't use this line.
  	end

  	def signed_in?
    	!current_user.nil?
  	end
end
