class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new_form
  end

  def create_row
    @actor = Actor.new
    @actor.dob = params[:dob]
    @actor.name = params[:name]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]

    @actor.save

    render("show")
  end

  def edit_form
    @actor = Actor.find(params[:id])
  end

  def update_row
    the_id = params[:id]
    update_actor = Actor.find(params[:id])
    dob = params[:dob]
    name = params[:name]
    bio = params[:bio]
    image_url = params[:image_url]
    @actor.dob = dob
    @actor.name = name
    @actor.bio = bio
    @actor.image_url = image_url
    @actor.save

    redirect_to("/actors/#{update_actor.id}")
  end

  def destroy
    @actor = Actor.find(params[:id])

    @actor.destroy
  end
end
