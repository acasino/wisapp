class WatchesController < ApplicationController

  # GET: /watches
  get "/watches" do
    @watches = Watch.all

    erb :"/watches/index.html"
  end

  # GET: /watches/new
  get "/watches/new.html" do
    erb :"/watches/new.html"
  end

  # POST: /watches
  post "/watches" do
    # user = current_user
    wristwatch = Watch.create(params["watch"]) #.reject{|_, v| v.blank?})  
    # wristwatch = Watch.new(params["watch"]) #.reject{|_, v| v.blank?})  
    if wristwatch.valid? 
      Userwatch.create(user: current_user, watch: wristwatch)
      # Userwatch.find_or_create_by(user: current_user, watch: wristwatch)
      flash[:success] = "Successfully created new watch."
      redirect '/users/profile.html' 
    else
      flash[:error] = wristwatch.errors.full_messages.first
      redirect '/watches/new.html'
    end
    # @user = current_user 
    # @watch = Watch.new
    # @watch.name = params['watch']['name']
    # @watch.dimensions = params['watch']['dimensions']
    # @watch.description = params['watch']['description']
    # @watch.price = params['watch']['price']
    # @watch.brand = params['watch']['brand']
    # @watch.genre = params['watch']['genre']
    # @watch.save
    # @user.watches << @watch
    # erb :"/users/profile.html"
    # redirect "/users/profile.html"
  end

  # # GET: /watches/5
  get "/watches/:id" do
    @user = current_user
    @watch = Watch.find_by_id(params[:id])
    # @userwatches = @user.userwatches.where(:user_id == @user.id)
    # @id = @watch.userwatches.where
    erb :"/watches/show.html"
  end

  # GET: /watches/5/edit
  get "/watches/:id/edit.html" do
    @watch = Watch.find_by_id(params[:id])
    erb :"/watches/edit.html"
  end

  # PATCH: /watches/5
  patch "/watches/:id" do
    @watch = Watch.find_by_id(params[:id])
    @watch.update(params[:watch])
    # @watch.description = params[:description]
    # @watch.price = params[:price]
    # @watch.save 
    redirect "/watches/#{@watch.id}"
  end

  # DELETE: /watches/5/delete
  delete "/watches/:id" do
    @user = current_user
    if logged_in?
      @watch = Watch.find_by_id(params[:id])
      @watch.delete
      flash[:message] = "#{@watch.name} Deleted"
      redirect "/users/profile.html"
    else
      flash[:message] = "Unable To Delete #{@watch.name}"
      redirect "/#{@watch.id}"
    end
  end
end
