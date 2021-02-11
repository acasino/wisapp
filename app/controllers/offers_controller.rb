class OffersController < ApplicationController

  # GET: /offers
  get "/offers" do
    @offers = Offer.all
    erb :"/offers/index.html"
  end

  # GET: /offers/new
  get "/offers/new" do

    erb :"/offers/new.html"
  end

  # POST: /offers
  post "/offers" do
    # user = current_user
    offer = Offer.create(params["offer"]) #.reject{|_, v| v.blank?})  
    if offer.valid? 
      flash[:success] = "Successfully created new offer."
      redirect '/offers/index.html' 
    else
      flash[:error] = wristwatch.errors.full_messages.first
      redirect '/watches/show.html'
    end
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
