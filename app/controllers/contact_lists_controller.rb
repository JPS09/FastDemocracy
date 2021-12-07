class ContactListsController < ApplicationController


  def new
    @user = current_user
    @contacts_list = Contact_list.new
  end


  def create
    @contact = Contact_list.new(contact_list_params)
    @contact_list.user = current_user
    @contact_list.save!
  end

  private

  def contact_list_params
    params.require(:contact_list).permit(:name)
  end


end
