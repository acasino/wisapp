class OffersController < ApplicationController

  # GET: /offers
  get "/offers" do
    if logged_in?
      @offers = Offer.all
      erb :"/offers/index.html"
    else
      redirect '/login'
    end
  end

  # GET: /offers/new
  get "/watches/:id/offers/new.html" do
    if logged_in?
      @watch = Watch.find_by_id(params[:id])
      if @watch
        erb :'/offers/new.html'
      else
      redirect '/not_found'
      end
    else
      redirect '/login'
    end
  end

  # # POST: /offers
  # post "/watches/:id/offers" do
  #   offer = Offer.create(params["offer"])
  #   wristwatch = Watch.find_by_id(params[:id])
  #   binding.pry

  #   if offer.valid? 
  #   offer.sender_id = current_user.id
  #   offer.receiver_id = watch.users.first.id
  #   offer.timestamp = DateTime.now
  #   offer.transaction_id = offer.id
  #   offer.status = 'Pending'
  #   offer.wanted_id = offer.id
  #   offer.watch_id = watch_id
  #   offer.save ##duplicate
  #     flash[:success] = "Successfully created new offer."
  #     redirect '/offers' 

  #   else
  #     flash[:error] = offer.errors.full_messages.first
  #     redirect '/offers' 
  #   end
  # end

    # POST: /offers
    post "/watches/:id/offers" do
      wristwatch = Watch.find_by_id(params[:id])
      offer = Offer.create(sender_id: current_user.id, receiver_id: wristwatch.users.first.id, sender_offer_price: params["offer"]["sender_offer_price"], watch_id: wristwatch.id)
      if offer.valid? 
        flash[:success] = "Successfully created new offer."
        redirect '/offers' 
      else
        flash[:error] = offer.errors.full_messages.first
        redirect '/offers' 
      end
    end
  

  # # GET: /offers/5
  get "/offers/:id" do
    if logged_in?
      @offer = Offer.find_by_id(params[:id])
      if @offer
        @watch = Watch.find_by_id(@offer.watch_id)
        @user = current_user
        erb :"/offers/show.html"
      else
      redirect '/not_found'
      end
    else
      redirect '/login'
    end
  end


  # PATCH: /offers/5
  patch "/offers/:id" do
    if logged_in?
      offer = Offer.find_by_id(params[:id])
      offer.status = "Accepted"
      offer.accepted = true ### get rid of accepted
      if offer.save  
        userwatch = Userwatch.where("watch_id =?", offer.watch_id) ##utilize macros
        userwatch.update(user_id: offer.sender_id)
        flash[:message] = "Offer Accepted"
        redirect "/users/profile.html"
      else
        redirect "/not_found" 
      end
    else
      flash[:message] = "Unable To Edit Offer"
      redirect '/login'
    end
  end


  # # DELETE: /offers/5/delete
  delete "/offers/:id" do
    if logged_in?
      offer = Offer.find_by_id(params[:id])
      offer.delete
      flash[:message] = "Offer Successfully Deleted"
      redirect "/offers"
    else
      flash[:message] = "Unable To Delete Offer"
      redirect "/offers/#{offer.id}"
    end
  end
end
