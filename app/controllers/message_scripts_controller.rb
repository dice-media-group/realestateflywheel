class MessageScriptsController < ApplicationController
  before_action       :authenticate_user!
  before_action :set_message_script, only: [:show, :edit, :update, :destroy]

  # GET /message_scripts
  def index
    # @message_scripts = MessageScript.order(:title).where("title like ?", "%#{params[:term]}%")
    @message_scripts = MessageScript.order(:title)
      .where("lower(title) like lower(?)", "%#{params[:term]}%")
      .select(:id, :title, :body)

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @message_scripts }
    end
    
  end

  # GET /message_scripts/1
  def show
    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @message_script }
    end
  end

  # GET /message_scripts/new
  def new
    @message_script = MessageScript.new
  end

  # GET /message_scripts/1/edit
  def edit
  end

  # POST /message_scripts
  def create
    @message_script = MessageScript.new(message_script_params)

    if @message_script.save
      redirect_to @message_script, notice: 'Message script was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /message_scripts/1
  def update
    if @message_script.update(message_script_params)
      redirect_to @message_script, notice: 'Message script was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /message_scripts/1
  def destroy
    @message_script.destroy
    redirect_to message_scripts_url, notice: 'Message script was successfully destroyed.'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_script
      @message_script = MessageScript.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_script_params
      params.require(:message_script).permit(:title, :body)
    end
end
