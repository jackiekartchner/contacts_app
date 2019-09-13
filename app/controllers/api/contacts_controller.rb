class Api::ContactsController < ApplicationController

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jb' 
  end

  def index
    @contacts = Contact.all

    if params[:search]
      @contacts = @contacts.where("first_name iLIKE ? OR middle_name iLIKE ? OR last_name iLIKE ? OR email iLIKE ? OR phone_number iLIKE ? OR bio iLIKE ? OR latitude iLIKE ? OR longitutde iLIKE ?", "%#{params[:search]}%",  "%#{params[:search]}%",  "%#{params[:search]}%",  "%#{params[:search]}%",  "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    if params[:group]
      group = Group.find_by(name: params[:group])
      @contacts = group.contacts.where(user_id: current_user.id)
    end

    @contacts = @contacts.order(:id)

    render 'index.json.jb'
  else
      render json: []
    end
  end

  def create
    coordinates = Geocoder.coordinates(params[:address])
    
    @contact = Contact.new(
        first_name: params[:first_name],
        middle_name: params[:middle_name],
        last_name: params[:last_name],
        email: params[:email],
        phone_number: params[:phone_number],
        bio: params[:bio],
        latitude: coordinates[0],
        longitutde: coordinates[1],
        user_id: current_user.id
      )
    if @contact.save
      render 'show.json.jb'
    else
      render json: {errors: @contact.errors.full_messages},
      status: :unprocessable_entity
    end
  end

  def update
    @contact = Contact.new(
       first_name: params[:first_name] || @contact.first_name,
       middle_name: params[:middle_name] || @contact.middle_name,
       last_name: params[:last_name] || @contact.last_name,
       email: params[:email] || @contact.email,
       phone_number: params[:phone_number] || @contact.phone_number,
       bio: params[:bio] || @contact.bio,
      )
    if @contact.save
      render 'show.json.jb'
    else
      render json: {errors: @contact.errors.full_messages},
      status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: {message: "This contact has been destroyed!"}
  end
end
