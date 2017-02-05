class ContactsController < ApplicationController
  
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action       :authenticate_user!

  # GET /contacts
  def index
    @contacts = current_user.contacts.all
  end

  # GET /contacts/1
  def show
  end

  # GET /contacts/new
  def new
    @contact = current_user.contacts.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  def create
    @contact = current_user.contacts.new(contact_params)

    if @contact.save
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = current_user.contacts.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(
            :first_name, 
            :last_name, 
            :email_address, 
            :street_one,
            :street_two,
            :city,
            :state,
            :zip,
            :primary_phone,
            :primary_phone_kind,
            :secondary_phone,
            :secondary_phone_kind,
            :addl_phone_one,
            :addl_phone_one_kind,
            :addl_phone_two,
            :addl_phone_two_kind,
            :lead_source)
    end
end
