class OffersController < ApplicationController

  # GET: /offers
  get "/offers" do
    erb :"/offers/index.html"
  end

  # GET: /offers/new
  get "/offers/new" do
    
    erb :"/offers/new.html"
  end

  # POST: /offers
  post "/offers" do
    redirect "/offers"
  end

  # # GET: /offers/5
  # get "/offers/:id" do
  #   erb :"/offers/show.html"
  # end

  # # GET: /offers/5/edit
  # get "/offers/:id/edit" do
  #   erb :"/offers/edit.html"
  # end

  # # PATCH: /offers/5
  # patch "/offers/:id" do
  #   redirect "/offers/:id"
  # end

  # # DELETE: /offers/5/delete
  # delete "/offers/:id/delete" do
  #   redirect "/offers"
  # end
end
