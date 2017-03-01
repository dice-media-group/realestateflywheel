class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action       :authenticate_user!

  # GET /messages
  def index
    @messages   = current_user.messages.all
    @contacts   = current_user.contacts.all
    @broadcasts = current_user.broadcasts.all
  end

  # GET /messages/1
  def show
    @contact = @message.contact
  end

  # GET /messages/new
  def new
    @message    = current_user.messages.new
    @broadcast  = current_user.broadcasts.new
    
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  def create
    @message          = current_user.messages.new(message_params)
    if message_params["message_script_id"].to_i > 0
      message_script    = MessageScript.find(message_params["message_script_id"])
      @message.title    = message_script.title
      @message.body     = message_script.body
    end
    

    if @message.save
      ContactCourierJob.perform_now(params: @message, phone_number: @message.contact.primary_phone)

      redirect_to @message, notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
    redirect_to messages_url, notice: 'Message was successfully destroyed.'
  end

  def sanitize_number(number)
    "+18014994594"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = current_user.messages.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:title, 
          :body, 
          :contact_id,
          :message_script_id,
          :message_script_title,
          :message_script_body)
    end
    
end
