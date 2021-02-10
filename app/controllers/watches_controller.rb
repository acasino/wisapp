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
    # @watch = Watch.create(params["watch"]) #.reject{|_, v| v.blank?})    
    # # unless params[:watch][:name].empty?
    # if watch.valid?
    #   flash[:success] = "Successfully created new watch."
    #   redirect '/users/profile.html' 
    # else
    #   flash[:error] = @watch.errors.full_messages.first
    #   redirect '/watches'
    # end
    @user = current_user
    @watch = Watch.new
    @watch.name = params['watch']['name']
    @watch.dimensions = params['watch']['dimensions']
    @watch.description = params['watch']['description']
    @watch.price = params['watch']['price']
    @watch.brand = params['watch']['brand']
    @watch.genre = params['watch']['genre']
    @watch.save
    @user.watches << @watch
    erb :"/users/profile.html"

  end

  # # GET: /watches/5
  get "/watches/:id" do
    @watch = Watch.find_by_id(params[:id])
    erb :"/watches/show.html"
  end

  # GET: /watches/5/edit
  get "/watches/:id/edit" do
    @watch = Watch.find_by_id(params[:id])
    erb :"/watches/edit.html"
  end

  # PATCH: /watches/5
  patch "/watches/:id" do
    @watch = Watch.find_by_id(params[:id])
    @watch.description = params[:description]
    @watch.price = params[:price]
    @watch.save 
    redirect "/watches/:id"
  end

  # DELETE: /watches/5/delete
  delete "/watches/:id/delete" do
    redirect "/watches"
  end
end
