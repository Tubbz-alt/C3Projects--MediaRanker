class WelcomeController < ApplicationController
  def index
    @movies = Movie.all
    render :index
  end
end
