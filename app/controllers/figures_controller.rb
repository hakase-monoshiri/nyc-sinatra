class FiguresController < ApplicationController

  # add controller methods
  get "/figures" do
    @figures = Figure.all
    erb :'figures/index'
  end

  get "/figures/new" do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  post "/figures" do
   @figure = Figure.create(params[:figure])
    
    @landmark = Landmark.find_or_create_by(params[:landmark])
    @landmark.figure = @figure
    @landmark.save

     @title = Title.find_or_create_by(params[:title])
     @figure.titles << @title
     @title.save
   
    @figure.save
  
    redirect to "/figures/#{@figure.id}"
  end

  get "/figures/:id" do

    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'
  end

  patch "/figures/:id" do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    
    @landmark = Landmark.find_or_create_by(params[:landmark])
    @landmark.figure = @figure
    @landmark.save

     @title = Title.find_or_create_by(params[:title])
     @figure.titles << @title
     @title.save
   
    @figure.save
  
    redirect to "/figures/#{@figure.id}"
  end

  
end
  