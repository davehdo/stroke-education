class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:show_by_key]

  # GET /reports
  def index
    if current_user.admin
      @reports = Report.desc(:created_at).page(params[:page])
    else
      @reports = current_user.reports.desc(:created_at).page(params[:page])
    end
  end

  # GET /reports/1
  # authenticated users access through here
  def show
  end

  # GET /r/12345
  # patients access through here
  def show_by_key
    if params[:key] and (@report = Report.where(keys: params[:key]).limit(1).first)
      # keep statistics of number of times accessed
      @report.record_access
      render :show
    else
      render inline: "Need a key to access this page", status: 401 
    end
  end
  
  # GET /reports/new
  def new
    @report = Report.new
    
    # pre-assign the ones that should be checked by default
    @report.parts << Part.where(:is_checked_by_default => true)
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  def create
    if user_signed_in?
      @report = current_user.reports.new(report_params)
    else
      @report = Report.new(report_params)
      
    end
    
    if @report.save
      redirect_to @report, notice: 'Report was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1
  def update
    unless @report.creator
      @report.assign_attributes(creator: current_user)
    end
    
    if @report.update(report_params)
      redirect_to @report, notice: 'Report was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
    redirect_to reports_url, notice: 'Report was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def report_params
      params.require(:report).permit(:initials, :part_ids => [])
    end
end
