class Manager::GenresController < ApplicationController

     def index
      @genres= Genre.all
      @newgenre = Genre.new
     end

     def edit
      @genre = Genre.find(params[:id])
     end

     def update
      genre = Genre.find(params[:id])
      genre.update(genre_params)
      redirect_to manager_genres_path
     end

     def create
      @genre = Genre.all
      genre = Genre.new(@genre_params)
      genre.save
      redirect_to manager_genres_path
     end

     private
      def genre_params
       params.require(:genre).permit(:name)
      end

end
