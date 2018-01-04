class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:show]

  # GET /reports
  def index
    @reports = Report.all
  end

  # GET /reports/1
  def show
    if params[:key] == @report.key # its a real user
      # keep statistics of number of times accessed
      @report.record_access
    else
      authenticate_user!  
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
