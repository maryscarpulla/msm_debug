class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    the_id = params[:id]
    @director = Director.find(the_id)
    render("directors/show_details.html.erb")
  end

  def new_form
    render("directors/new_form.html.erb")
  end

  def create_row
    @director = Director.new
    dob = params[:dob]
    name = params[:name]
    bio = params[:bio]
    image_url = params[:image_url]
    @director.dob = dob
    @director.name = name
    @director.bio = bio
    @director.image_url = image_url
    @director.save

    render("show_details")
  end

  def edit_form
    @director = Director.find(params[:id])
  end

  def update_row

    dob = params[:dob]

    name = params[:name]
    bio = params[:bio]
    image_url = params[:image_url]
    @director = Director.find(params[:id])
    @director.dob = dob
    @director.name = name

    @director.bio = bio
    @director.image_url = image_url
    @director.save
    render("show_details")
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy
  end
end
