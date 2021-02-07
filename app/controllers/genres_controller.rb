class GenresController < ApplicationController

  # GET: /genres
  get "/genres" do
    erb :"/genres/index.html"
  end

  # GET: /genres/new
  get "/genres/new" do
    erb :"/genres/new.html"
  end

  # POST: /genres
  post "/genres" do
    redirect "/genres"
  end

  # GET: /genres/5
  get "/genres/:id" do
    erb :"/genres/show.html"
  end

  # GET: /genres/5/edit
  get "/genres/:id/edit" do
    erb :"/genres/edit.html"
  end

  # PATCH: /genres/5
  patch "/genres/:id" do
    redirect "/genres/:id"
  end

  # DELETE: /genres/5/delete
  delete "/genres/:id/delete" do
    redirect "/genres"
  end
end
