class BodyPartsController < ApplicationController
  def index
    matching_body_parts = BodyPart.all

    @list_of_body_parts = matching_body_parts.order({ :created_at => :desc })

    render({ :template => "body_parts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_body_parts = BodyPart.where({ :id => the_id })

    @the_body_part = matching_body_parts.at(0)
    
    matching_stretches = Stretch.where({ :id => the_id })

    @the_stretch = matching_stretches.at(0)

    render({ :template => "body_parts/show.html.erb" })
  end

  def create
    the_body_part = BodyPart.new
    the_body_part.name = params.fetch("query_name")

    if the_body_part.valid?
      the_body_part.save
      redirect_to("/body_parts", { :notice => "Body part created successfully." })
    else
      redirect_to("/body_parts", { :alert => the_body_part.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_body_part = BodyPart.where({ :id => the_id }).at(0)

    the_body_part.name = params.fetch("query_name")

    if the_body_part.valid?
      the_body_part.save
      redirect_to("/body_parts/#{the_body_part.id}", { :notice => "Body part updated successfully."} )
    else
      redirect_to("/body_parts/#{the_body_part.id}", { :alert => the_body_part.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_body_part = BodyPart.where({ :id => the_id }).at(0)

    the_body_part.destroy

    redirect_to("/body_parts", { :notice => "Body part deleted successfully."} )
  end
end
