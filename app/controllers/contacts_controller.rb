class ContactsController < ApplicationController
  before_action :new_contact, only: [:new, :create]
  before_action :find_contact, only: [:update, :show]

  def new
    @user = current_user
  end

  def index
    @contacts = Contact.all
  end

  def create
    @contact.save
  end

  def update
    @contact.update(contact_params)
    @contact.save
  end

  def show
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :first_name, :last_name, :user_id)
  end

  def new_contact
    @contact = Contact.new(contact_params)
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end
end
