class UsersController < ApplicationController

	get '/signup' do 
		erb :'users/create_user'
	end

	post '/signup' do 
		binding.pry
		@user = User.new(username: params[:username], email: params[:email], password: params[:password])
		if @user.username != "" &&  @user.email != "" && @user.password != ""
			@user.save
			redirect '/login'
		else
			redirect '/signup'
		end
	end

	get '/login' do 
		erb :'users/login'
	end

	post '/login' do 
		@user = User.find_by(username: params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
			redirect '/tweets'
		else
			redirect '/signup'
		end
	end



end
