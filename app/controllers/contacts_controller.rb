class ContactsController < ApplicationController
  
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action       :authenticate_user!

  # GET /contacts
  def index
    @tag_name = params[:tag]
    
    if @tag_name.to_s.length > 0
      @contacts = current_user.contacts.tagged_with(@tag_name)
    else
      @contacts = current_user.contacts
    end
  end

  # GET /contacts/1
  def show
    @milestones = @contact.milestones.all
    @photos = @contact.photos.all
    @messages = @contact.messages.all
  end

  # GET /contacts/new
  def new
    @contact  = current_user.contacts.new
    # @tags     = [{name: "family"}, {name: "past clients"}, {name: "prospects"}] #available_tags(current_user)
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  def create
    @contact = current_user.contacts.new(contact_params)

    if @contact.save
      tag_list = Array(contact_params["tag_list"])
      tag_list = tag_list.reject(&:empty?)
      Contact.add_owned_tags(contact: @contact, tag_list: tag_list, user: current_user)
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      tag_list = Array(contact_params["tag_list"])
      tag_list = tag_list.reject(&:empty?)
      Contact.add_owned_tags(contact: @contact, tag_list: tag_list, user: current_user)
      
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
      @contact = Contact.find(params[:id])
      
    end

    def tag_name
      params[:tag] || ""
    end
     
    def available_tags(user)
      basic_tags = ActsAsTaggableOn::Tag.all.where("basic = ?", true).map(&:name)
      # current_user_tags = user.contacts.tag_counts_on(:tags)
      # available_tags    = basic_tags.merge(current_user_tags)
    end
    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(
            {:roster_ids => []},
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
            :lead_source,
            :image,
            {:tag_list => []},
            {milestones_attributes: [:id, :_destroy, :description, :date]},           
            {photos_attributes: [:id, :_destroy, :description, :image, :remote_image_url]}           
            )
    end
end
