class Manager::GenresController < ApplicationController
 before_action:authenticate_admin!
     def index
      @genres= Genre.all
      @genre = Genre.new
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
      #@genres = Genre.all
      genre = Genre.new(genre_params)
      genre.save
      redirect_to manager_genres_path
     end

     private
      def genre_params
       params.require(:genre).permit(:name)
      end

end
