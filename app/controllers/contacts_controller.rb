class ContactsController < ApplicationController
  def index
    @contacts = Contact.all 
    respond_to do |format|
      format.html
      format.csv { send_data @contacts.to_csv, filename: "contacts-#{Date.today}.csv"}
    end
  end

  def import
    Contact.import(params[:file])
    redirect_to root_url notice: 'Data imported!'
  end 

  def create
    @contact = Contact.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      email: params[:email]
      )
    redirect_to root_url notice: 'Contact created!'
  end



end
