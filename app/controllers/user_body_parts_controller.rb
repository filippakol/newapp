class UserBodyPartsController < ApplicationController
  def index
    matching_user_body_parts = UserBodyPart.all

    @list_of_user_body_parts = matching_user_body_parts.order({ :created_at => :desc })

    render({ :template => "user_body_parts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_user_body_parts = UserBodyPart.where({ :id => the_id })

    @the_user_body_part = matching_user_body_parts.at(0)

    render({ :template => "user_body_parts/show.html.erb" })
  end

  def create
    the_user_body_part = UserBodyPart.new
    the_user_body_part.user_id = params.fetch("query_user_id")
    the_user_body_part.body_part_id = params.fetch("query_body_part_id")

    if the_user_body_part.valid?
      the_user_body_part.save
      redirect_to("/user_body_parts", { :notice => "User body part created successfully." })
    else
      redirect_to("/user_body_parts", { :alert => the_user_body_part.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user_body_part = UserBodyPart.where({ :id => the_id }).at(0)

    the_user_body_part.user_id = params.fetch("query_user_id")
    the_user_body_part.body_part_id = params.fetch("query_body_part_id")

    if the_user_body_part.valid?
      the_user_body_part.save
      redirect_to("/user_body_parts/#{the_user_body_part.id}", { :notice => "User body part updated successfully."} )
    else
      redirect_to("/user_body_parts/#{the_user_body_part.id}", { :alert => the_user_body_part.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user_body_part = UserBodyPart.where({ :id => the_id }).at(0)

    the_user_body_part.destroy

    redirect_to("/user_body_parts", { :notice => "User body part deleted successfully."} )
  end
end
