class WatchesController < ApplicationController

  # GET: /watches
  get "/watches" do
    if logged_in?
      @watches = Watch.all
      @offers = Offer.all
      erb :"/watches/index.html"
    else
      redirect '/login'
    end
  end


  # GET: /watches/new
  get "/watches/new.html" do ##redirect if not logged in
    if logged_in?
      erb :"/watches/new.html"
    else
      redirect '/login'
    end
  end


  # POST: /watches
  post "/watches" do
    wristwatch = Watch.create(params["watch"]) 

    if wristwatch.valid?
      Userwatch.create(user: current_user, watch: wristwatch) if !current_user.watches.include?(wristwatch)
      flash[:success] = "Successfully created new watch."
      redirect '/users/profile.html' 
    else
      flash[:error] = wristwatch.errors.full_messages.first
      redirect '/watches/new.html'
    end
  end


  # # GET: /watches/5
  get "/watches/:id" do
    if logged_in?
      @user = current_user
      @watch = Watch.find_by_id(params[:id])
      if @watch
        erb :"/watches/show.html"
      else
        redirect '/not_found'
      end
    else
      redirect '/login'
    end
  end


  # GET: /watches/5/edit
  get "/watches/:id/edit.html" do  
    if logged_in?
      @watch = Watch.find_by_id(params[:id])
      @userwatch = Userwatch.find_by_id(params[:id])
      if @watch && @userwatch.user_id == current_user.id 
        erb :"/watches/edit.html"
      else
        redirect '/not_found'
      end
    else
      redirect '/login'
    end
  end


  # PATCH: /watches/5
  patch "/watches/:id" do
    if logged_in?
      watch = Watch.find_by_id(params[:id])
      watch.update(params[:watch])
      redirect "/watches/#{watch.id}"
    else
      flash[:message] = "Unable To Update #{watch.name}"
      redirect '/login'
    end
  end


  # DELETE: /watches/5/delete
  delete "/watches/:id" do
    if logged_in?
      watch = Watch.find_by_id(params[:id])
      watch.delete
      Userwatch.where("watch_id = ?", watch.id).delete_all
      flash[:message] = "#{watch.name} Deleted"
      redirect "/users/profile.html"
    else
      flash[:message] = "Unable To Delete #{watch.name}"
      redirect "/#{watch.id}"
    end
  end
end
