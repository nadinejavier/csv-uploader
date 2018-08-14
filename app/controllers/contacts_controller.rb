class ContactsController < ApplicationController
  def index
    @contacts = Contact.all 
  end

  def import
    Contact.import(params[:file])
    redirect_to root_url notice: 'Data imported!'
  end 
end
