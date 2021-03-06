class FavoritingsController < ApplicationController
  def index
    @favoritings = Favoriting.all
  end

  def show
    @favoriting = Favoriting.find(params[:id])
  end

  def new
    @favoriting = Favoriting.new
  end

  def create
    @favoriting = Favoriting.new
    @favoriting.photo_id = params[:photo_id]
    @favoriting.favorited_by_id = params[:favorited_by_id]

    if @favoriting.save
      redirect_to "/favoritings", :notice => "Favoriting created successfully."
    else
      render 'new'
    end
  end

  def edit
    @favoriting = Favoriting.find(params[:id])
  end

  def update
    @favoriting = Favoriting.find(params[:id])

    @favoriting.photo_id = params[:photo_id]
    @favoriting.favorited_by_id = params[:favorited_by_id]

    if @favoriting.save
      redirect_to "/favoritings", :notice => "Favoriting updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @favoriting = Favoriting.find(params[:id])

    @favoriting.destroy

    redirect_to "/favoritings", :notice => "Favoriting deleted."
  end
end
