class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show_by_key]

  def show_by_key
    @message = Message.find_by(key: params[:key])
    
    @message.record_access
    
    @report = @message.report

    render "reports/show"
  end
  
  # GET /messages
  def index
    if current_user.admin
      @reports = Report.desc(:created_at).page(params[:page])
    else
      @reports = current_user.reports.desc(:created_at).page(params[:page])
    end
    
    
    @messages = Message.where(report_id: @reports.collect {|r| r.to_param})
  end

  # GET /messages/1
  def show
  end

  # GET /messages/new
  # this is nested within report
  def new
    @reports = Report.find( params[:report_id])
    
    message = Message.prototypes.find {|e| e[:category] == params[:message_category].to_i}

    @message = @reports.messages.new( 
      message_category: params[:message_category], 
      text: message ? message[:text] : nil
    )
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  def create
    @reports = Report.find( message_params[:report_id])

    @message = @reports.messages.new(message_params)

    if @message.save
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:text, :recipient, :report_id, :message_category)
    end
end
