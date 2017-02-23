class PhotosController < ApplicationController
  before_action :load_contact, only: [:index, :new]
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  def index
    @photos = @contact.photos.all
    
  end

  # GET /photos/1
  def show
    
  end

  # GET /photos/new
  def new
    @contact = Contact.find_by("id = ?",params[:contact_id])
    @contact.photos.build
    # @photo = @contact.photos.new(@contact)
    #
    # @machine = Machine.new
    # @machine.parts.build
    
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  def create
    @photo = @contact.photos.new(photo_params)

    if @photo.save
      redirect_to @contact, notice: 'Photo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update(photo_params)
      redirect_to @photo.contact, notice: 'Photo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /photos/1
  def destroy
    @contact = @photo.contact
    @photo.destroy
    redirect_to @contact, notice: 'Photo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def load_contact
      @contact = Contact.find_by("id = ?",params[:contact_id])
    end

    # Potential idea for using controller either nested or not
    # http://tammersaleh.com/posts/almost-painless-nested-resources/
    
    # def photos
    #   `contact ? `contact.photos : Photo
    # end

    def set_photo
      @photo = Photo.find(params[:id])
    end


    # Only allow a trusted parameter "white list" through.
    def photo_params
      params.require(:photo).permit(:image, :description, :contact_id)
    end
    
end
