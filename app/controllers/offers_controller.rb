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
    # offer = Offer.create(params["offer"])#.reject{|_, v| v.blank?}  
    @watch = Watch.find_by_id(params[:id])
    offer = Offer.new
    offer.sender_id = current_user.id
    offer.receiver_id = @watch.userwatches.where(:watch_id == @watch.id)
    offer.sender_offer_price = params['offer']['sender_offer_price']
    offer.timestamp = DateTime.now
    offer.transaction_id = offer.id
    offer.status = 'Pending'
    offer.wanted_id = offer.id
    offer.accepted = false 
    offer.save
    # @user.watches << @watch
    binding.pry
    if offer.valid? 
      flash[:success] = "Successfully created new offer."
      redirect '/offers/index.html' 
    else
      flash[:error] = offer.errors.full_messages.first
      # redirect '/watches/show.html'
      redirect '/offers' 

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
