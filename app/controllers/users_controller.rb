class UsersController < ApplicationController

  # GET: /users/new
  get "/signup" do
    erb :signup
  end

  # POST: /users
  post "/signup" do
    user = User.create(params["user"])
    if user.valid?
      flash[:success] = "Successfully created new user."
      session["user_id"] = user.id
      redirect '/login' 
    else
      flash[:error] = user.errors.full_messages.first
      redirect '/signup'
    end
  end

  # # GET: /users  #remove?
  get '/users/profile.html' do
    if logged_in?
      @user = current_user
      @watchsum = current_user.watches.sum(:price).to_d
      erb :"/users/profile.html"
    else
      redirect '/login'
    end
  end

    # # GET: /users/5
  # get "/users/:id" do
  #   if logged_in? 
  #     @user = User.find_by_id(params[:id])
  #     @watchsum = @user.watches.sum(:price).to_d
  #     if @user && @user == current_user
  #       erb :"/users/profile.html"
  #     else
  #       redirect '/not_found'
  #     end
  #   else
  #     redirect '/login'
  #   end
  # end

  # # GET: /users/5/edit
  get "/users/:id/edit" do
    if logged_in? && !!current_user
      @user = User.find_by_id(params[:id])
      erb :"/users/edit.html"
    else
      redirect '/not_found'
    end
  end

  # # PATCH: /users/5 #not used
  patch "/users/:id" do
    if logged_in?
      user = User.find_by_id(params[:id])
      user.profile = params[:profile]
      user.save 
      flash[:success] = "Successfully Updated Profile."
      redirect "/users/profile.html" 
    else 
      flash[:message] = "Unable To Edit Profile"
      redirect '/login'
    end
  end


  # #DELETE:
  delete '/logout' do
    session.clear
    redirect '/login'
  end

end


