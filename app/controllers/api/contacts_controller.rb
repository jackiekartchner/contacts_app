class Api::ContactsController < ApplicationController

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jb' 
  end

  def index
    @contacts = Contact.all
    render 'index.json.jb'
  end

  def create
    @contact = Contact.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        phone_number: params[:phone_number]
      )
    @contact.save 
    render 'create.json.jb'
  end

  def update
    @contact = Contact.new(
       first_name: params[:first_name] || @contact.first_name,
        last_name: params[:last_name] || @contact.last_name,
        email: params[:email] || @contact.email,
        phone_number: params[:phone_number] || @contact.phone_number
      )
    @contact.save
    render 'update.json.jb'
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: {message: "This contact has been destroyed!"}
  end
end
