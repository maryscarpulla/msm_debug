class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    the_id = params[:id]
    @movie = Movie.find(the_id)

  end

  def new_form
    render("movies/new_form.html.erb")

  end

  def create_row
    @movie = Movie.new
    title = params[:title]
    year = params[:year]
    duration = params[:duration]
    description = params[:description]
    image_url = params[:image_url]
    director_id = params[:director_id]
    @movie.title = title
    @movie.year = year
    @movie.duration = duration
    @movie.description = description
    @movie.image_url = image_url
    @movie.director_id = director_id
    @movie.save
    render("show")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    the_id = params[:id]
    title = params[:title]
    year = params[:year]
    duration = params[:duration]
    description = params[:description]
    image_url = params[:image_url]
    director_id = params[:director_id]
    @movie = Movie.find(the_id)
    @movie.title = title
    @movie.year = year
    @movie.duration = duration
    @movie.description = description
    @movie.image_url = image_url
    @movie.director_id = director_id
    @movie.save
    render("show")
  end

  def destroy


    the_id = params[:id]
    title = params[:title]
    year = params[:year]
    duration = params[:duration]
    description = params[:description]
    image_url = params[:image_url]
    director_id = params[:director_id]
    delete_movie = Movie.find(the_id)
    delete_movie.title = title
    delete_movie.year = year
    delete_movie.duration = duration
    delete_movie.description = description
    delete_movie.image_url = image_url
    delete_movie.director_id = director_id
    delete_movie.destroy

    redirect_to("/movies")

  end
end
