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
    @watch = Watch.create(params["user"])
    if watch.valid?
      flash[:success] = "Successfully created new watch."
      session["user_id"] = @user.id
      redirect '/watches' ###sluggable###
    else
      flash[:error] = @user.errors.full_messages.first
      redirect '/watches'
    end

  end

  # # GET: /watches/5
  get "/watches/:id" do
    erb :"/watches/show.html"
  end

  # GET: /watches/5/edit
  get "/watches/:id/edit" do
    erb :"/watches/edit.html"
  end

  # PATCH: /watches/5
  patch "/watches/:id" do
    redirect "/watches/:id"
  end

  # DELETE: /watches/5/delete
  delete "/watches/:id/delete" do
    redirect "/watches"
  end
end
