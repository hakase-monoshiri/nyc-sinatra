class LandmarksController < ApplicationController
  # add controller methods
  get "/landmarks" do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get "/landmarks/new" do

    erb :'landmarks/new'
  end

  post "/landmarks" do
    # params[:landmark][:year_created] = params[:landmark][:year_created].to_i
    @figure = Figure.find_by(name: params[:landmark][:figure])
    if @figure
      params[:landmark][:figure] = @figure
    else
      params[:landmark][:figure] = Figure.create(name: params[:landmark][:figure])
    end
    @landmark = Landmark.create(params[:landmark])
  
    redirect to "/landmarks/#{@landmark.id}"
  end

  get "/landmarks/:id" do

    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    @figure = Figure.find_by(name: params[:landmark][:figure])
    if @figure
      params[:landmark][:figure] = @figure
    else
      params[:landmark][:figure] = Figure.create(name: params[:landmark][:figure])
    end
    @landmark.update(params[:landmark])
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end

  delete "/landmarks/:id" do
  end


end
