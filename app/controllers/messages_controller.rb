class MessagesController < ApplicationController
  # before_action :set_message, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :set_user

  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id

    respond_to do |format|
      p "RP ==> #{request.params}"
      if @message.save
        format.turbo_stream {}
        # format.html {redirect_to root_path }
        # format.json { render :show, status: :created, location: @message }
      else
        format.turbo_stream {render turbo_stream: turbo_stream.replace(@message, partial: "messages/form", locals: {message: @message, tavern_id: @message.tavern_id, user_id: @message.user_id} )}
        # format.html { redirect_to root_path }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update

  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      # format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:user_id, :content, :tavern_id)
    end

    def set_user
      @user = current_user
    end

end
