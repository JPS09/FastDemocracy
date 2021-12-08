class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_contact, only: [:update, :show]

  def new
    @user = current_user
    @contact = Contact.new

  end

  def index
    @contacts = Contact.all
    @contact = Contact.new
    @contact_list = ContactList.new

  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    @contact.save!
  end

  def update
    @contact.update(contact_params)
    @contact.save
  end



  def show
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :first_name, :last_name)
  end

  def find_contact
    @contact = Contact.find(params[:id])

  end

end
