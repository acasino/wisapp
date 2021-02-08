require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash 
  end

  get "/" do
    redirect '/login'
  end

  get '/login' do
    #redirect_if_logged_in
    erb :index
  end

  post "/login" do
    @user = User.find_by_email(params["user"]["email"])
    if @user && @user.authenticate(params["user"]["password"])
      session["user_id"] = @user.id
      flash[:success] = "Successfully logged in."
      # erb :'users/index.html' #sluggable
      # redirect 'users/profile.html'
      erb :"/users/profile.html"
    else 
      flash[:error] = "Invalid credentials."
      redirect "/login"
    end
  end

  get "/logout" do
    session.clear 
    redirect "/"
  end

  # get ['/signin', '/access'] do
  #   redirect '/login'
  # end

  # error Sinatra::NotFound do
  #   erb :"error.html"
  # end

   helpers do

      def find_by_username_or_email
        User.find_by(:username => params[:username]) || User.find_by(:email => params[:email])
      end

      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end

      def logged_in?
        !!current_user
      end

  #   def redirect_if_not_logged_in
  #     if !logged_in?
  #       redirect "/login"
  #     end
  #   end

  #   def not_the_owner?(obj)
  #     if current_user != obj.user
  #       flash[:error] = "You do not have permission to access this page."
  #       redirect "/login" #update**
  #     end
  #   end
   end


end
