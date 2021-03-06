class Admin::GenresController < ApplicationController

  before_action :authenticate_admin!

  def index
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save!
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_update_params)
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.permit(:name)
  end

  def genre_update_params
    params.require(:genre).permit(:name)
  end

end
