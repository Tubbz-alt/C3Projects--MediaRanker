class MoviesController < ApplicationController

  before_action :get_movie, only: [:show, :edit, :update, :upvote, :destroy]

  def get_movie
    @movie = Movie.find(params[:id])
  end

  # Show movie(s)
  def index
    @movies = Movie.all
  end

  def show
  end

  # Add a movie
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)

    redirect_to movie_path(@movie.id)
  end

  # Edit a movie
  def edit
  end

  def update
    @movie.update(movie_params)

    redirect_to movie_path
  end

  # Upvote a movie
  def upvote
    @movie.vote += 1
    @movie.save

    redirect_to movie_path
  end

  # Delete a movie
  def destroy
    @movie.destroy

    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :director, :desc)
  end

end
