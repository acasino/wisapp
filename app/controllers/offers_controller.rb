class OffersController < ApplicationController

  # GET: /offers
  get "/offers" do
    @offers = Offer.all
    erb :"/offers/index.html"
  end

  # GET: /offers/new
  get "/watches/:id/offers/new.html" do
    @watch = Watch.find_by_id(params[:id])
    erb :'/offers/new.html'
  end

  # POST: /offers
  post "/watches/:id/offers" do
    offer = Offer.create(params["offer"])
    watch_id = params[:id]
    watch = Watch.find_by_id(watch_id)
    # offer = Offer.create(params["offer"])

    if offer.valid? 
    offer.sender_id = current_user.id
    offer.receiver_id = watch.users.first.id
    offer.timestamp = DateTime.now
    offer.transaction_id = offer.id
    offer.status = 'Pending'
    offer.wanted_id = offer.id
    offer.watch_id = watch_id
    offer.save
      flash[:success] = "Successfully created new offer."
      redirect '/offers' 

    else
      flash[:error] = offer.errors.full_messages.first
      # redirect '/watches/show.html'
      redirect '/offers' 

    end
  end

  # # GET: /offers/5
  get "/offers/:id" do
    @offer = Offer.find_by_id(params[:id])
    erb :"/offers/show.html"
  end
  Userwatch.where("watch_id = ?", watch.id).delete_all


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
