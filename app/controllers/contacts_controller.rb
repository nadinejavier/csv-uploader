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
end
