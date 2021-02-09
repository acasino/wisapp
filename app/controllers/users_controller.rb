class UsersController < ApplicationController

  # GET: /users/new
  get "/signup" do
    erb :signup
  end

  # POST: /users
  post "/signup" do
    @user = User.create(params["user"])
    if user.valid?
      flash[:success] = "Successfully created new user."
      session["user_id"] = @user.id
      redirect '/login' ###sluggable###
    else
      flash[:error] = @user.errors.full_messages.first
      redirect '/signup'
    end
  end

  # # GET: /users
  get '/users/profile.html' do
    if logged_in?
      @user = current_user
      erb :"/users/profile.html"
    else
      redirect '/login'
    end
  end

    # # GET: /users/5
  get "/users/:id" do
    if logged_in? #valid_credentials?
      @user = User.find_by_id(params[:id])
      if @user
        erb :"/users/profile.html"
      else
        redirect '/not_found'
      end
    end
  end

  # # GET: /users/5/edit
  get "/users/:id/edit" do
    if logged_in? && !!current_user
      @user = User.find_by_id(params[:id])
      erb :"/users/edit.html"
    else
      redirect '/not_found'
    end
  end

  # # PATCH: /users/5
  patch "/users/:id" do
    @user = User.find_by_id(params[:id])
    @user.profile = params[:profile]
    @user.save 
    # redirect '/users/:id' #Goes to "NOT FOUND" from /:id for some reason
    redirect "/users/profile.html" #cannot update profile
  end


  # #DELETE:
  delete '/logout' do
    session.destroy
    redirect to '/login'
  end




  # # GET: /users
  # get "/users" do
  #   erb :"/users/index.html"
  # end

  # # GET: /users/new
  # get "/users/new" do
  #   erb :"/users/new.html"
  # end

  # # POST: /users
  # post "/users" do
  #   redirect "/users"
  # end

  # # GET: /users/5
  # get "/users/:id" do
  #   erb :"/users/show.html"
  # end

  # # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end

  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end

  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end


