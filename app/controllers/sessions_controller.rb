class SessionsController < ApplicationController
	def create
		post=Postt.from_omniauth(env["omniauth.auth"])
		session[:id] = post.post_id
		redirect_to root_url
	end

	def destroy
		session[:id]=nil
		redirect_to root_url
	end
end